require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  get  '/check', to: 'application#service'

  root to: 'application#service'
end
