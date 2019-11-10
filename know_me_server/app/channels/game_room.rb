# frozen_string_literal: true

# app/channels/game_room.rb
class GameRoom < ApplicationCable::Channel
  def subscribed
    stream_from "my_channel_#{current_user.id}"
  end
end
