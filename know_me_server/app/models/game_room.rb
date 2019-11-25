# frozen_string_literal: true

# Class GameRoom
class GameRoom < ActiveRecord::Base
  has_many :users

  def users_as_json
    text = {}
    users.each do |user|
      text[user.name] = user.icon
    end
    text
  end
end
