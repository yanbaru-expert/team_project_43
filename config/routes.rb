Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'texts#index'
  resources :texts ,only: [:index, :show] do
    resource :reads, only: [:create, :destroy]
  end
end
