class DevicesController < ApplicationController

  post "/devices" do
    params = fetch_params || {}
    resp = DeviceCreator.new(params).call
    if resp.valid?
      status 200
      body ::DeviceSerializer.new(resp.response).serialized_json
    else
      error(422, resp.response)
    end
  end

  get "/devices" do
    status 200
    body ::DeviceSerializer.new(Device.all).serialized_json
  end
end
