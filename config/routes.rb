Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root to: 'tasks#index'
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
end
