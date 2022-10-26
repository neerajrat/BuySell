Rails.application.routes.draw do
  root "home#index"



  default_url_options :host => "example.com"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }


  get  "/home/user", to:  "home#user"
  get  "/home/admin", to:  "home#admin"
  get  "/users/sign_out", to:  "users/sessions#destroy"
  


  get  "/products/index", to:  "products#index"
  get  "/products/sell", to:  "products#sell"
  get  "/products/myproduct", to:  "products#myproduct"
  get  "/products/:id", to: "products#show"

  patch  "/product/accept", to:  "products#accept"
  get  "/product/reject", to:  "products#reject"




  resources:products, only:[:new , :create , :destroy, :edit , :update] 



  resources :users do
    resources:products
  end
  resource:contact




  end
