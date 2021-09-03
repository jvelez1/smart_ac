require_relative './notification_rules'

class DeviceEventCreator < ApplicationService
  NOTIFICATION_RULES = {
    "TEMPERATURE" => ::NotificationRules::Temperature,
    "AIR_HUMIDITY" => ::NotificationRules::AirHumidity,
    "CARBON_MONOXIDE" => ::NotificationRules::CarbonMonoxide
  }

  def initialize(device, params)
    @device = device
    @device_event_params = params['device_events']
  end

  def call
    events = device_event_params.map { |event| DeviceEvent.new(device: device, **event) }
    events.map { |event| event.valid? && event.save }
    notify_users(events)
    result(true, events)
  end

  private

  def notify_users(events)
    persisted_events = events.select { |event| event.persisted? }
    persisted_events.each do |event|
      service = NOTIFICATION_RULES[event.type].new(event)
      service.notify if service.matches? || event.status != 'OK'
    end
  end

  attr_reader :device, :device_event_params
end
