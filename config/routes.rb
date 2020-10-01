Rails.application.routes.draw do
  resources :entries, only: [:create]
  # resources :user_tasks
  resources :tasks, only: [:show, :create, :destroy]
  # resources :user_projects
  resources :projects, only: [:index, :show, :create, :destroy]
  resources :users, only: [:create, :show]
  post '/login', to: 'auth#login'

end
