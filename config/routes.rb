Rails.application.routes.draw do
  default_url_options :host => "example.com"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }


  root "home#index"
  get  "/home/user", to:  "home#user"
  get  "/home/admin", to:  "home#admin"

  get  "/products/index", to:  "products#index"
  get  "/products/:id", to: "products#show"


  resources :users do
    resources:products
  end
  resource:contact




  end
