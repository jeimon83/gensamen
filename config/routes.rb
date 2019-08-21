require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get  '/check', to: 'application#service'
  post '/login', to: 'authentication#authenticate'
  
  resources :users,       only: [:index]
  resources :patients do
     resources :contacts
  end
  resources :clinics,     only: [:index, :show]
  resources :internments, only: [:index]

  root to: 'application#service'

end
