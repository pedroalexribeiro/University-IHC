# frozen_string_literal: true

# Game Controller
class GameController < ApplicationController
  before_action :set_game_room, only: %i[game_room final_answer]
  before_action :set_question_number, only: %i[game_room]
  before_action :set_round_number, only: %i[game_room round]

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
    if @number.to_i < 5
      @question_theme = QuestionTheme.find(@round)
      @question = @question_theme.questions.order(:id).limit(4)[@number.to_i - 1]
      session['question_id'] = @question.id
      ActionCable.server.broadcast("game_channel_stuff", JSON.generate(question: @question.id, answers: select_answers))
      respond_to do |format|
        format.js { render :game_room }
        format.html { render :game_room }
      end
    else
      redirect_to round_path
    end
  end

  def round
    offset = rand(QuestionTheme.count)
    @question_theme = QuestionTheme.offset(offset).first
    @question_theme = QuestionTheme.offset(offset).second if @question_theme.id == @round
    session['round_number'] = session['round_number'] ? (session['round_number'] + 1) : 1
    @number = 1
    if session['round_number'] < 3
      respond_to do |format|
        format.js { render :round }
        format.html { render :round }
      end
    else
      redirect_to end_screen_path
    end
  end

  def final_answer
    @number = params['number'].to_i
    @question = Question.find_by(id: session['question_id'])
    number_players = @game_room.users.count
    answers = UserAnswer.where(question_id: session['question_id']).last(number_players)
    @rez = {}
    answers.group_by(&:name).each do |name, user_answers|
      @rez[name] = user_answers.count
    end
    select_answers
  end

  def point_screen; end

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
    @number = params['number'] ? (params['number']) : 1
  end

  def set_round_number
    offset = rand(QuestionTheme.count)
    theme = QuestionTheme.offset(offset).first
    session['round'] ||= theme.id
    @round = session['round'].to_i
  end
end
