Rails.application.routes.draw do

  root to: 'landing#show'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get :user_page, to: 'static_pages#user_page'

  get :dashboard, to: "restaurants#dashboard"

  get :restaurant_orders, to: "orders#restaurant_orders"
  get :cart, to: "carts#show"
  
  get :splitcart, to: "carts#splitcart"
  get :splitorder, to: "orders#splitorder"


  post :add_meal, to: "carts#add_meal"
  delete :remove_meal, to: "carts#remove_meal"
  post :update_meal, to: "carts#update_meal"
  resources :orders

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :meals
  end

  resources :restaurant_applications

  resources :phone_numbers, only: [:edit, :update]
  post 'phone_numbers/verify' => "phone_numbers#verify"

end
