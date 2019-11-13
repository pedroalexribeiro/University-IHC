# frozen_string_literal: true

module ApplicationCable
  # Connection Class
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      self.uuid = SecureRandom.urlsafe_base64
      puts uuid
    end
  end
end
