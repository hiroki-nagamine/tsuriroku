Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users do
    member do
      get :followings
      get :followers
      get :likings
    end
    # collection do ユーザーの検索機能をつける場合に使用
    #   get :serach
    # end
  end
  
  resources :records
  resources :relationships, only: [:create,:destroy]
  resources :likes, only: [:create, :destroy]
end
