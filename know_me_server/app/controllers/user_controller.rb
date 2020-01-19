# frozen_string_literal: true

# Game Controller
class UserController < ApplicationController
  def index; end

  def create
    game_room = GameRoom.find_by(code: params[:room])
    @room = params[:room]
    redirect_to index_path if game_room.nil?
  end

  def get_image
    url1 = ActionController::Base.helpers.asset_path('icon1.png')
    url2 = ActionController::Base.helpers.asset_path('icon2.png')
    url3 = ActionController::Base.helpers.asset_path('icon3.png')
    url4 = ActionController::Base.helpers.asset_path('icon4.png')
    url5 = ActionController::Base.helpers.asset_path('icon5.png')
    url6 = ActionController::Base.helpers.asset_path('icon6.png')
    rez = {one: url1, two: url2, three: url3, four: url4, five: url5, six: url6}
    respond_to do |format|
      format.json { render json: rez }  # respond with the created JSON object
    end
  end

  def wait
    unless params['room'].nil?
      game_room = GameRoom.find_by(code: params['room'])
      game_room.users.create(name: params['name'], icon: params['icon'])
      @name = params['name']
      @icon = params['icon']
    end

    respond_to do |format|
      format.js {render layout: false, content_type: 'text/javascript'}
      format.html
    end
  end
end