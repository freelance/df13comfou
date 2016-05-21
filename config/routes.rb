Rails.application.routes.draw do
    
  namespace :admin do
    resources :users
    resources :objetivos
    resources :legajos
    resources :convenios

    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
