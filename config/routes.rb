Rails.application.routes.draw do
  root "application#homepage"
  get "/wakeup", to: "auth#wakeup"
  post "/login", to: "auth#login"
  resources :users, only: [:create, :show, :update]
  resources :projects, only: [:index, :show, :create, :update, :destroy]
  resources :milestones, only: [:show, :create, :update, :destroy]
  resources :tasks, only: [:show, :create, :update, :destroy]
  resources :entries, only: [:create, :update, :destroy]
  resources :reports, only: [:create, :show, :destroy]
end
