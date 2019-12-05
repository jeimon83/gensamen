require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get  '/check', to: 'application#service'
  post '/login', to: 'authentication#authenticate'
  
  resources :users,       only: [:index]
  
  resources :clinics, shallow: true do
    resources :patients do
      resources :contacts
      resources :internments
    end
    resources :help_requests
  end
  
  resources :configs
  root to: 'application#service'

end