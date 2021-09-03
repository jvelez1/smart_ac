require_relative './base'

module NotificationRules
  class Temperature < Base
    def matches?
      false
    end
  end
end
