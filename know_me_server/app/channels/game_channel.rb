# frozen_string_literal: true

# app/channels/game_channel.rb
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_channel_#{request.params[:room]}"
  end

  def information(args)
    game_room = GameRoom.find(code: args['code'])
    game_room.users.create(name: args['name'], icon: args['icon'])
  end
end
