Rails.application.routes.draw do
  namespace :api, defaults: {format: :json } do 
    namespace :v1 do 
      resources :merchants, only: [:index]
      resources :customers, only: [:index]
      resources :transactions, only: [:index]
    end
  end
end