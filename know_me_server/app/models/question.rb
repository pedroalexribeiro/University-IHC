# frozen_string_literal: true

# Class Question
class Question < ActiveRecord::Base
  belongs_to :question_theme

  enum question_type: {
    general: 0,
    specific: 1
  }

  validates_acceptance_of :status, accept: question_types.keys, message: 'is invalid.', on: :update
end
