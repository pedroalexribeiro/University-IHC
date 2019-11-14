# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  mount ActionCable.server => '/cable'

  get 'gameroom/create', to: 'landing#create_room', as: :create_room

  get 'gameroom/play', to: 'landing#game_room', as: :game_room

  get 'gameroom/end', to: 'landing#end_screen', as: :end_screen

  get 'fill/questions', to: 'landing#fill'
end
