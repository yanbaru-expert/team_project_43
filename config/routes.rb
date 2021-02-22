Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'texts#index'
  resources :texts, only: [:index, :show] do
    resource :reads, only: [:create, :destroy]
  end
  resources :movies, only: [:index]
<<<<<<< HEAD
  resources :texts ,only: [:index, :show]
  resources :movies, only: [:index, :show] do
    resource :watcheds, only: [:create, :destroy]
  end
=======
>>>>>>> 7f26b52d82974c1a5e5b35612eafd7d8106f5137
end
