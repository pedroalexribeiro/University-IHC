# frozen_string_literal: true

# app/channels/user_channel.rb
class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{uuid}"
  end

  def check_game_room
  end
end
