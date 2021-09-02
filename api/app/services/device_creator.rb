class DeviceCreator
  def initialize(params)
    @device_params = params['devices']
  end

  def call
    device = Device.new(device_params)
    if device.valid?
      device.save
      result(true, device)
    else
      result(false, device.errors.messages)
    end
  end

  private

  attr_reader :device_params

  def result(valid, resp)
    OpenStruct.new(valid?: valid, response: resp)
  end
end
