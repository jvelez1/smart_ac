class Device
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :serial, type: String
  field :secret, type: String
  field :token, type: String
  field :firmware_version, type: String
  field :registration_date, type: Date

  has_many :device_events, dependent: :delete_all

  validates_presence_of :token, :serial, :secret, :firmware_version, :registration_date
end
