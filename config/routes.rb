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
        resources :comments, only: [:index, :create]
      end      
    end
    
    resources :help_requests do
      resources :comments,only: [:index, :create]
    end
    
    resources :report_requests do
      resources :comments, only: [:index, :create]
    end
    
    member do
      get :contacts
      get :internments
    end
  end

  resources :comments, only: [:show, :update, :destroy]
  
  resources :configs
  resources :report_definitions

  root to: 'application#service'
end