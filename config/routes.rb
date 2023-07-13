Rails.application.routes.draw do
  devise_for :users
  root to: 'words#index'
  resources :words do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:index, :show, :destroy]
  resources :dictionaries, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
