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
      end
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :transactions, only: [:index, :show]
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
      end
      resources :invoice_items, only: [:index, :show]
    end
  end

end
