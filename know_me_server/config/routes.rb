# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  mount ActionCable.server => '/cable'

  get 'gameroom/create', to: 'landing#create_room'
end
