Rails.application.routes.draw do
  resources :entries
  # resources :user_tasks
  resources :tasks, only: [:show]
  # resources :user_projects
  resources :projects, only: [:index, :show]
  resources :users, only: [:create, :show]
  post '/login', to: 'auth#login'

end
