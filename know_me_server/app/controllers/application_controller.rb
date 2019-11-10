# frozen_string_literal: true

# application_controller.rb
class ApplicationController < ActionController::Base
  include Knock::Authenticable
  # before_action :authenticate_user
end
