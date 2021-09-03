module NotificationRules
  class Base
    def initialize(device_event)
      @device_event = device_event
      @message = device_event.status
    end
  
    def matches?
      raise NotImplementedError
    end


    ### this need to be changed to use websockets / background jobs / any queue system
    def notify
      users.map { |user| UserNotification.create(user: user, message: message) }
    end
  
  
    private
  
    attr_reader :device_event, :message
    
    def users
      @users ||= User.all
    end
  end
end
