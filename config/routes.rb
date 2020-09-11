# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [] do
    get :followers
    get :followeds
  end

  resources :clubs, only: [] do
    get :followers
    get :followeds
  end
end
