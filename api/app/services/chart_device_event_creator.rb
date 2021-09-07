class ChartDeviceEventCreator < ApplicationService
  def initialize(params)
    @params = params
  end

  def call
    air = query_device_event('AIR_HUMIDITY')
    temp = query_device_event('TEMPERATURE')
    carbon = query_device_event('CARBON_MONOXIDE')

    result = [].tap do |res|
      res << build_event(air)
      res << build_event(temp)
      res << build_event(carbon)
    end
    result.flatten
  end

  private

  attr_reader :params

  def query_device_event(event_type)
    DeviceEvent.where(type: event_type).order(created_at: :desc).limit(10).to_a
  end

  def build_event(events)
    return [] unless events.any?

    {
      label: events.first.type,
      input_labels: events.map(&:created_at),
      data: events.map(&:value)
    }
  end
end
