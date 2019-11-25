# frozen_string_literal: true

Rails.application.routes.draw do
  root 'game#index'

  mount ActionCable.server => '/cable'

  get 'gameroom/create', to: 'game#create_room', as: :create_room
  get 'gameroom/play', to: 'game#game_room', as: :game_room
  get 'gameroom/end', to: 'game#end_screen', as: :end_screen
end
