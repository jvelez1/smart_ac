class DeviceEventsController < ApplicationController
  # POST: /device_events
  post "/device_events" do
    device = fetch_device
    
    status 200
    body 'ok!'
  end

  private

  def fetch_device
    token = request.env['HTTP_DEVICE_TOKEN']
  end
end
