class ChartDeviceEventCreator < ApplicationService
  def initialize(params)
    @params = params
    puts @params
  end

  def call
    air = DeviceEvent.last_by_type(type: 'AIR_HUMIDITY')
    temp = DeviceEvent.last_by_type(type: 'TEMPERATURE')
    carbon = DeviceEvent.last_by_type(type: 'CARBON_MONOXIDE')

    result = [].tap do |res|
      res << build_event(air)
      res << build_event(temp)
      res << build_event(carbon)
    end
    result.flatten
  end

  private

  attr_reader :params

  def build_event(events)
    {
      label: events.first.type,
      input_labels: events.map(&:created_at),
      data: events.map(&:value)
    }
  end
end
