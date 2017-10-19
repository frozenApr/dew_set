module ApplicationCable
  class Connection < ActionCable::Connection::Base
    include SessionsHelper
    identified_by :speak_user
    def connect
      self.speak_user = current_user
    end
  end
end
