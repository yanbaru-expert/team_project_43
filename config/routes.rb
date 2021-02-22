Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'texts#index'
  resources :movies, only: [:index]
  resources :texts ,only: [:index, :show]
  resources :movies, only: [:index, :show] do
    resource :watcheds, only: [:create, :destroy]
  end
end
