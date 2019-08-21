require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  get  '/check', to: 'application#service'
  post '/login', to: 'authentication#authenticate'
  
  resources :users,       only: [:index]
  resources :patients,    only: [:index]
  resources :clinics
  resources :contacts,    only: [:index]
  resources :internments, only: [:index]

  root to: 'application#service'

end
