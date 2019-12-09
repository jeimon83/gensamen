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
      resources :comments, only: [:index, :create], module: 'patients'

      resources :internments do
        resources :comments, only: [:index, :create], module: 'internments'
        resources :report_requests, only: [:create]
        resources :help_requests, only: [:create]
        member do
          get :report_requests
          get :help_requests
        end
      end      
    end
    
    member do
      get :internments
      get :help_requests
    end

  end

  resources :help_requests, only: [:show, :update, :destroy] do
    resources :comments, only: [:index, :create], module: 'help_requests'
  end

  resources :report_requests, only: [:show, :update, :destroy] do
    resources :comments, only: [:index, :create], module: 'report_requests'
  end

  resources :comments, only: [:show, :update, :destroy]
  
  resources :configs
  resources :report_definitions

  root to: 'application#service'
end