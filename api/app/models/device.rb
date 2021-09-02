class Device
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :serial, type: String
  field :secret, type: String
  field :token, type: String

  validates_presence_of :token
end
