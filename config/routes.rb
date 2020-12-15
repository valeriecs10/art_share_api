Rails.application.routes.draw do
  # get, post, patch, put, delete
  # index, show, destroy, update, create
  
  resources :users, only: [:index, :show, :create, :destroy, :update] do
    resources :artworks, only: :index
  end
  resources :artworks, only: [:show, :create, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :artworks do
    patch 'favorite'
  end
  resources :artwork_shares do
    patch 'favorite'
  end
end
