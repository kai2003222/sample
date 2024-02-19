Rails.application.routes.draw do
  # ... 既存のルート

  resources :sindans, only: [:index]  # sindans_controller.rbのindexアクションを追加

  devise_for :users

  resources :users, only: [:show] 
  
  resources :posts do
    resources :likes, only: [:create, :destroy]

    collection do
      get 'ran'
    end
  end
  root 'posts#index'
  
  resources :perfumes
end
