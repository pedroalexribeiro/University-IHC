# frozen_string_literal: true

# app/channels/game_channel.rb
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_channel_#{request.params[:room]}"
  end
end
