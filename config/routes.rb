Rails.application.routes.draw do

  root to: 'landing#show'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get :user_page, to: 'static_pages#user_page'

  get :cart, to: "carts#show"
  post :add_meal, to: "carts#add_meal"
  delete :remove_meal, to: "carts#remove_meal"
  patch :update_meal, to: "carts#update_meal"
  resources :orders, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :meals
  end
  resources :restaurant_applications

end
