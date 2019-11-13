# frozen_string_literal: true

# app/channels/game_channel.rb
class GameChannel < ApplicationCable::Channel
  def subscribed
    puts 'Ola pedro'
    stream_from "game_channel_#{params[:room]}"
  end
end
