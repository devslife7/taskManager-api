Rails.application.routes.draw do
  resources :user_tasks
  resources :tasks
  resources :user_projects
  resources :projects
  resources :users, only: [:create]

  # post '/login', to: 'auth#login'

end
