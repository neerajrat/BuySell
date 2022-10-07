Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }


  root "home#index"
  get  "/home/user", to:  "home#user"
  get  "/home/admin", to:  "home#admin"


  end
