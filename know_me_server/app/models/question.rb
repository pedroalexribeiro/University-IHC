# frozen_string_literal: true

# Class Question
class Question < ActiveRecord::Base
  belongs_to :question_theme

  has_many :answers

  enum question_type: {
    general: 0,
    specific: 1
  }

  validates_acceptance_of :status, accept: question_types.keys, message: 'is invalid.', on: :update

  def answers_as_json
    position = 1
    text = {}
    answers.each do |answer|
      text[position] = answer.color
      position += 1
    end
    text['number'] = position
    text['type'] = question_type
    text
  end
end
