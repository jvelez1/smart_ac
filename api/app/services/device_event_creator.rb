class DeviceEventCreator < ApplicationService
  def initialize(device, params)
    @device = device
    @device_event_params = params['device_events']
  end

  def call
    events = device_event_params.map { |event| DeviceEvent.new(device: device, **event) }
    events.map { |event| event.valid? && event.save }
    result(true, events)
  end

  private

  attr_reader :device, :device_event_params
end
