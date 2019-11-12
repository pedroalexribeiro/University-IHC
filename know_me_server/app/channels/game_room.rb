# frozen_string_literal: true

# app/channels/game_room.rb
class GameRoom < ApplicationCable::Channel
  def subscribed
    puts "Ola pedro"
    stream_from "game_channel_#{params[:room]}_#{current_user.id}"
  end
end
