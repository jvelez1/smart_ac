class DeviceCreator < ApplicationService
  def initialize(params)
    @device_params = params['devices']
  end

  def call
    token = generate_token(device_params)
    device = Device.new(device_params.merge('token' => token))
    if device.valid?
      device.save
      result(true, device)
    else
      result(false, device.errors.messages)
    end
  end

  private

  attr_reader :device_params

  def generate_token(params)
    payload = params.select{ |k, _|['serial', 'secret'].include?(k) }
    TokenGenerator.encrypt(payload)
  end
end
