Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index]
      resources :items, only: [:index]
      resources :invoice_items, only: [:index]
    end
  end
end
