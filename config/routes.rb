Rails.application.routes.draw do

  root to: 'landing#show'

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :meals
  end



  get :user_page, to: 'static_pages#user_page'
end
