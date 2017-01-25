Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      namespace :customers do
        get "/find" => "find#index"
      end
      namespace :merchants do
        get "/find" => "find#index"
      end
      namespace :transactions do 
        get "/find" => "find#index"
      end
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end

end
