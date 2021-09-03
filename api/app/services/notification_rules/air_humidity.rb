require_relative './base'

module NotificationRules
  class AirHumidity < Base
    def matches?
      false
    end
  end
end
