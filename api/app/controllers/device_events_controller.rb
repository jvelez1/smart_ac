class DeviceEventsController < ApplicationController
  # POST: /device_events
  post "/device_events" do
    device = fetch_device
    params = fetch_params
    resp = DeviceEventCreator.new(device, params).call
    if resp.valid?
      status 200
      body ::DeviceEventSerializer.new(resp.response).serialized_json
    else
      error(422, resp.response)
    end
  end

  get "/device_events/charts" do
    params = fetch_params || {}
    chart_data = ChartDeviceEventCreator.new(params).call

    status 200
    body chart_data.to_json
  end

  private

  def fetch_device
    token = request.env['HTTP_DEVICE_TOKEN']
    device = Device.by_token(token) if token
    return device if device

    error(404, { error: 'Device not found' })
  end
end
