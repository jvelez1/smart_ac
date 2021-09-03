class DeviceEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :type, type: String
  field :value, type: Float
  field :measurement, type: String
  field :event_time, type: DateTime
  field :status, type: String

  belongs_to :device

  validates_inclusion_of :type, in: [ "TEMPERATURE", "AIR_HUMIDITY", "CARBON_MONOXIDE" ]
  validates_length_of :status, minimum: 1, maximum: 150
end
