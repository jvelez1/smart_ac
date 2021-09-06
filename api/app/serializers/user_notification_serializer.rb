class UserNotificationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :message, :topic
end
