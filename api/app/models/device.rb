class Device
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :serial, type: String
end
