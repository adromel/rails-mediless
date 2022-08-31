Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # vue de la recherche symptoms
  resources :symptoms do
    resources :essential_oils
    resources :acu_points
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
