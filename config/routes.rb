Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_for :agents, only: :registrations
  devise_for :clients, only: :registrations
  root "pages#home"
end
