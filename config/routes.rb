Rails.application.routes.draw do
  devise_for :agents
  devise_for :users
  root "pages#home"
end
