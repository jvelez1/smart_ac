class DeviceEventSerializer
  include FastJsonapi::ObjectSerializer

  attributes :type, :value, :measurement, :event_time, :status

  attribute :errors do |object|
    object.errors.messages
  end

  attribute :saved do |object|
    object.persisted?
  end
end
