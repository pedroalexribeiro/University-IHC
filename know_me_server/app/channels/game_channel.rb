# frozen_string_literal: true

# app/channels/game_channel.rb
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_channel_#{params[:room]}"
  end

  def enter_room(args)
    args = JSON.parse(args['args'])
    game_room = GameRoom.find_by(code: args['code'])
    game_room.users.create(name: args['name'], icon: args['icon'])
  end

  def answer(args)
    args = JSON.parse(args['args'])
    UserAnswer.create(question_id: args['question'], name: args['answer'])
  end
end
