class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :first_name, type: String
  field :second_name, type: String
  field :email, type: String
  field :password, type: String # todo
  has_many :user_notifications, dependent: :delete_all
end
