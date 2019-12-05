require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get  '/check', to: 'application#service'
  post '/login', to: 'authentication#authenticate'
  
  resources :users, only: [:index]
  
  get   '/profile', to: 'users#profile',        as: 'profile'
  patch '/profile', to: 'users#update_profile', as: 'edit_profile'
      
  resources :clinics, shallow: true do
    resources :patients do
      resources :contacts
      resources :internments
    end
    resources :report_requests
    member do
      get :contacts
      get :internments
    end
  end
  
  resources :configs
  resources :report_definitions

  root to: 'application#service'
end