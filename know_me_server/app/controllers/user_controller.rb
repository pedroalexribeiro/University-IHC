# frozen_string_literal: true

# Game Controller
class UserController < ApplicationController
  def index; end

  def create
    game_room = GameRoom.find_by(code: params[:room])
    @room = params[:room]
    redirect_to index_path if game_room.nil?
  end

  def wait
    unless params['room'].nil?
    game_room = GameRoom.find_by(code: params['room'])
    game_room.users.create(name: params['name'], icon: params['icon'])
    end

    respond_to do |format|
      format.js {render layout: false, content_type: 'text/javascript'}
      format.html
    end
  end
end