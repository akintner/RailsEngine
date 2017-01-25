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
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end

end
