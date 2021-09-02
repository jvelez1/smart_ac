class DeviceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :serial, :token
end
