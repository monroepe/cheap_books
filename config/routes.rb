Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :articles do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resources :votes, only: [:create]
  end

  resources :topics do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end
end
