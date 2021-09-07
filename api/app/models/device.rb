class Device
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :serial, type: String
  field :secret, type: String
  field :token, type: String
  field :firmware_version, type: String
  field :registration_date, type: Date

  index({ serial: 1, secret: 1 }, { unique: true })

  has_many :device_events, dependent: :delete_all

  validates_presence_of :token, :serial, :secret, :firmware_version, :registration_date
  validates_uniqueness_of :serial, :scope => [:secret]


  def self.by_token(token)
    payload = TokenGenerator.decrypt(token)
    where(serial: payload['serial'], secret: payload['secret']).first if payload
  end
end
