Rails.application.routes.draw do
  get 'acu_points/show'
  get 'essential_oils/show'
  get 'symptoms/show'
  devise_for :users
  root to: "pages#home"

  get "/test", to: "pages#test"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
