# frozen_string_literal: true

Rails.application.routes.draw do
  root 'game#index'

  mount ActionCable.server => '/cable'

  get 'gameroom/create', to: 'game#create_room', as: :create_room
  get 'gameroom/play', to: 'game#game_room', as: :game_room
  get 'gameroom/end', to: 'game#end_screen', as: :end_screen
  get 'gameroom/round', to: 'game#round', as: :round
  get 'gameroom/point_screen', to: 'game#point_screen', as: :point_screen
  get 'gameroom/final_answers', to: 'game#final_answer', as: :final_answer

  get 'user/', to: 'user#index', as: :index
  post 'user/create', to: 'user#create', as: :user_create
  post 'user/wait', to: 'user#wait', as: :user_wait
  get 'user/wait', to: 'user#wait'
  get 'user/get_image', to: 'user#get_image'
end
