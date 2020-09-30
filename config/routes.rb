Rails.application.routes.draw do
  # resources :user_tasks
  # resources :tasks
  # resources :user_projects
  resources :projects, only: [:index]
  resources :users, only: [:create, :show]
  post '/login', to: 'auth#login'

end
