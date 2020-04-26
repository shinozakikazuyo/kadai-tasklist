Rails.application.routes.draw do
  
  root to: 'tasks#index'
  resources :tasks
  
  #サインアップ
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :new, :create]
  
  #ログイン
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  #新規投稿、投稿の削除
  resources :tasks, only: [:create, :destroy]
  
end
