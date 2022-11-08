Rails.application.routes.draw do
  get 'categories/index'

  root "home#index"
  resources:categories
  default_url_options :host => "example.com"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }

  get  "/home/user", to:  "home#user"
  get  "/home/admin", to:  "home#admin"
  get  "/users/sign_out", to:  "users/sessions#destroy"

  get  "/users/block", to:  "users#block"
  get  "/users/unblock", to:  "users#unblock"

  get  "/products/index", to:  "products#index"
  get  "/products/sell", to:  "products#sell"
  get  "/search", to:  "products#search"
  get  "/search_category", to:  "products#search_category"

  get  "/products/myproduct", to:  "products#myproduct"
  get  "/products/:id", to: "products#show"
  get  "/product/accept", to:  "products#accept"
  get  "/product/reject", to:  "products#reject"
  get  "/product/offeraccept", to:  "products#offeraccept"

  get  "/product/productname", to:  "products#productname"
  get  "/product/pending", to:  "products#pending"
  get  "/product/offer", to:  "products#offer"
  get  "/product/proposal", to:  "products#proposal"
  get  "/view", to:  "proposals#view"





  resources:products, only:[:new , :create , :destroy, :edit , :update] 

  resources :users do
    resources:products
  end

  resources :prodcut do
    member do
      resource:proposals, only:[:new, :create, :edit, :update] 
      get  "/proposals", to:  "proposals#index"

    end
  end

  resource:contact
  end
