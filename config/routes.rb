# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :agents, only: :registrations, controllers: { registrations: 'users/registrations' }
  devise_for :clients, only: :registrations, controllers: { registrations: 'users/registrations' }
  root 'pages#home'
end
