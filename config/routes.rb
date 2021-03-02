Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'texts#index'
  resources :texts, only: [:index, :show] do
    resource :reads, only: [:create, :destroy]
  end
  resources :movies, only: [:index]
end
