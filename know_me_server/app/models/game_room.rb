# frozen_string_literal: true

# Class GameRoom
class GameRoom < ActiveRecord::Base
  has_many :users

  def send_answer
    text = {}
    users.each do |user|
      text[user.name] = user.icon
    end
  end

  def receive_answer
    # Do something
  end
end
