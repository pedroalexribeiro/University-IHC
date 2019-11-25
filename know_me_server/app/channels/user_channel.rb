# frozen_string_literal: true

# app/channels/user_channel.rb
class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "user_#{uuid}"
  end

  def check_game_room(args)
    args = JSON.parse(args['args'])
    code = args['code']
    game_room = GameRoom.find_by(code: code)
    if game_room
      ActionCable.server.broadcast "user_#{uuid}", notification: 'Welcome'
    else
      ActionCable.server.broadcast "user_#{uuid}", notification: 'Error, couldn\'t find'
    end
  end
end
