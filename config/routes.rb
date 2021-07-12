Rails.application.routes.draw do
  resources :entries, only: [:create, :update, :destroy]
  resources :milestones, only: [:show]
  # resources :user_tasks
  resources :tasks, only: [:show, :create, :destroy]
  # resources :user_projects
  resources :projects, only: [:index, :show, :create, :destroy]
  resources :users, only: [:create, :show, :update]
  post '/login', to: 'auth#login'

end
