Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      namespace :customers do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :merchants do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
        get "/most_items" => "merchants_items_business#index"
        get '/most_revenue' => 'top_revenue#index'
        get '/revenue' => 'date_revenue#index'
      end
      namespace :transactions do 
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
      end
      namespace :invoices do
        get "/find" => "find#index"
        get "/find_all" => "find_all#index"
        get "/random" => "random#index"
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
        get "/most_items" => "items_most#index"
        get "/most_revenue" => "items_most_revenue#index"
      end
     
      resources :merchants, only: [:index, :show] do
        get "/revenue" => "merchant_revenue#index"
        get '/items' => 'relationship_merchant_items#index'
        get '/invoices' => 'relationship_merchant_invoices#index'
        get '/favorite_customer' => 'merchant_favorites#index'
      end
      resources :customers, only: [:index, :show] do
        get '/invoices' => 'relationship_customer_invoices#index'
        get '/transactions' => 'relationship_customer_transactions#index'
        get "favorite_merchant" => "customer_favorites#index"
      end
      resources :transactions, only: [:index, :show] do
        get '/invoice' => 'relationship_transaction_invoice#index'
      end
      resources :invoices, only: [:index, :show] do 
        get "/transactions" => "relationships_invoice_transactions#index"
        get "/invoice_items" => "relationships_invoice_invoice_items#index"
        get "/items" => "relationships_invoice_items#index"
        get "/customer" => "relationship_invoice_customer#index"
        get "/merchant" => "relationship_invoice_merchant#index"
      end
      resources :items, only: [:index, :show] do 
        get "/invoice_items" => "relationships_item_invoice_items#index"
        get "/merchant" => "relationship_item_merchant#index"
        get "/best_day" => "item_best_day#index"
      end
      resources :invoice_items, only: [:index, :show] do
        get "/invoice" => "relationship_invoice_item_invoice#index"
        get "/item" => "relationship_invoice_item_item#index"
      end
    end
  end

end
