Rails.application.routes.draw do
  get 'oiltreatments/show'
  devise_for :users
  root to: "pages#home"

  #vue de la recherche home
  get 'search', to: 'symptoms#search'

  # vue de la recherche symptoms

  resources :essential_oils

  resources :symptoms do
    resources :oil_treatments
  end
  resources :essential_oils do
    resources :list_elements, only: :create
  end


  resources :symptoms do
    member do
      get :acupoints
    end
    resources :acupoint_treatments
    resources :oil_treatments
  end
  resources :acupoints do
    resources :list_elements, only: :create
  end

  # get '/symptoms/:id', to: 'symptoms#show'
  resources :list_elements, only: :destroy

  get "/test", to: "pages#test"
  get "threejs", to: "pages#threejs"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
