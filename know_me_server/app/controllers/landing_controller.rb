# frozen_string_literal: true

# Landing Controller
class LandingController < ApplicationController
  def index; end

  def create_room
    code = (0...5).map { (65 + rand(26)).chr }.join
    game_room = GameRoom.new(code: code, active: true)
    if game_room.save
      redirect_to firms_path
    else
      flash[:error] = 'Some error while creating game room'
      render :index
    end
  end

  def send_possible_answers
    ActionCable.server.broadcast "game_channel_#{request.params[:room]}", notification: 'Error, couldn\'t find'
  end
end
