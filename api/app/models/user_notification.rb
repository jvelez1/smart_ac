class UserNotification
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :readed, type: Boolean, default: false
  field :message, type: String
  field :topic, type: String
  
  belongs_to :user
end
