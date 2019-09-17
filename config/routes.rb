require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get  '/check', to: 'application#service'
  post '/login', to: 'authentication#authenticate'
  
  resources :users, only: [:index] do
    member do
      get   '/profile',   to: 'users#profile'
      patch '/profile',   to: 'users#update_profile'
    end
  end
      
  resources :clinics, shallow: true do
    resources :patients do
      resources :contacts
      resources :internments
    end
    member do
      get :contacts
      get :internments
    end
  end
  
  resources :configs

  root to: 'application#service'

end