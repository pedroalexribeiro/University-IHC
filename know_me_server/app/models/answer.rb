# frozen_string_literal: true

# Class Answer
class Answer < ActiveRecord::Base
  belongs_to :question
end
