Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      namespace :customers do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
      end
      namespace :merchants do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
      end
      namespace :transactions do 
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
      end
      namespace :invoices do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
        resources only: [:show] do
          get "/transactions" => "transactions_relationships#index"
          get "/invoice_items" => "invoice_items_relationships#index"
          get "/items" => "items_relationships#index"
          get "/customer" => "customer_relationship#index"
          get "/merchant" => "merchant_relationship#index"
        end
      end
      namespace :invoice_items do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :items do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
        resources only: [:show] do 
          get "/invoice_items" => "invoice_items_relationships#index"
          get "/merchant" => "merchant_relationship#index"
        end
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
