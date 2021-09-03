require_relative './base'

module NotificationRules
  class CarbonMonoxide < Base
    def matches?
      if device_event.value > 9 && device_event.measurement == 'PPM'
        @message = 'CO PPM HIGH'
        return true
      end
    end
  end
end
