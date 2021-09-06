class UsernotificationsController < ApplicationController
  get "/user_notifications" do
    # @todo
    user = User.first
    notifications = user.user_notifications.where(readed: false).limit(3)
    status 200
    body ::UserNotificationSerializer.new(notifications).serialized_json
  end


  post "/user_notifications/:id/read" do
    id = params['id']
    # @todo
    user = User.first
    notification = user.user_notifications.where(id: id).first
    notification.update(readed: true)
    status 200
  end
end
