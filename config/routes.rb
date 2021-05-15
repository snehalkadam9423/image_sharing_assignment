# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :albums do
    member do
      get :show_album
    end
    resources :photos
  end
  resources :users do
    get :profile
  end
end
