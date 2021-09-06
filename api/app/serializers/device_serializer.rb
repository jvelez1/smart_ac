class DeviceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :serial, :firmware_version, :registration_date, :created_at
end
