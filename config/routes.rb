Rails.application.routes.draw do

  # get "/customers/:customer_id", to: "customers#show"
  #
  # get "/supermarkets/:supermarket_id", to: "supermarkets#show"
  #
  # get "/supermarkets/:supermarket_id/items", to: "supermarket_items#index"

  resources :customers
  resources :supermarkets

  resources :supermarkets do
    resources :items, controller: 'supermarket_items'
  end
end
