Rails.application.routes.draw do
  get 'oiltreatments/show'
  devise_for :users
  root to: "pages#home"

  #vue de la recherche home
  get 'search', to: 'symptoms#search'


  # vue de la recherche symptoms
  resources :symptoms do
    resources :oil_treatments
  end
  resources :essential_oils

  resources :symptoms do
    resources :acupoint_treatments
  end
  resources :acu_points


  # get '/symptoms/:id', to: 'symptoms#show'
  get "/test", to: "pages#test"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
