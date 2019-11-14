# frozen_string_literal: true

# Class User
class User < ActiveRecord::Base
  belongs_to :game_room
end
