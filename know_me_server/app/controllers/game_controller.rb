# frozen_string_literal: true

# Game Controller
class GameController < ApplicationController
  before_action :set_game_room, only: %i[game_room]
  before_action :set_question_number, only: %i[game_room]

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
    if @number < 5
      @question_theme = QuestionTheme.find_by(name: 'default')
      @question = @question_theme.questions.limit(5)[@number - 1]
      ActionCable.server.broadcast("game_channel_#{@game_room.code}", JSON.generate(select_answers))
      respond_to do |format|
        format.js { render :game_room }
        format.html { render :game_room }
      end
    else
      respond_to do |format|
        format.js { render :end_screen }
        format.html { render :end_screen }
      end
    end
  end

  def end_screen; end

  private

  def select_answers
    if @question.general?
      @answers = @game_room.users
      @game_room.users_as_json
    else
      @answers = @question.answers
      @question.answers_as_json
    end
  end

  def set_game_room
    @game_room = GameRoom.find_by(code: session['game_room'])
  end

  def set_question_number
    @number = params['number'] ? params['number'].to_i : 1
  end
end
