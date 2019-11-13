# frozen_string_literal: true

# Class Question
class Question < ActiveModel::Base
  has_one :question_theme
end
