class DeviceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :serial, :token, :firmware_version, :registration_date
end
