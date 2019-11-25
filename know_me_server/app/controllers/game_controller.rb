# frozen_string_literal: true

# Game Controller
class GameController < ApplicationController
  before_action :set_game_room, only: %i[game_room]

  def index; end

  def create_room
    @code = (0...5).map { (65 + rand(26)).chr }.join
    game_room = GameRoom.new(code: @code, active: true)
    if game_room.save
      session[:game_room] = @code
      render :create_room
    else
      flash[:error] = 'Some error while creating game room'
      render :index
    end
  end

  def game_room
    @number = params['number'].to_f
    if @number < 5
      @question_theme = QuestionTheme.find_by(name: 'default')
      @question = @question_theme.questions.limit(@number - 1)
      ActionCable.server.broadcast("game_channel_#{@game_room.code}", JSON.generate(@game_room.send_answer))
      respond_to do |format|
        format.js { render :game_room }
        format.html { render :game_room }
      end
    else
      redirect_to end_screen_path
    end
  end

  def end_screen; end

  private

  def set_game_room
    @game_room = GameRoom.find_by(code: session['game_room'])
  end
end
