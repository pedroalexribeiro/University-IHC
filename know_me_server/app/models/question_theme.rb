# frozen_string_literal: true

# Class Theme
class QuestionTheme < ActiveRecord::Base
  has_many :questions
end
