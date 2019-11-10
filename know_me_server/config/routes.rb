# frozen_string_literal: true

Rails.application.routes.draw do
  root 'landing#index'

  mount ActionCable.server => '/cable'

  get 'landing/index'
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
