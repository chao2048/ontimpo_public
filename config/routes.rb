Rails.application.routes.draw do
  resources :todos
  resources :motivations
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #GET /about
  get "about", to: "about#index"
  get "events", to: "events#index"
  get "timetable", to: "timetable#index"
  get "counter", to: "counter#index"

  get "password", to: "password#edit", as: :edit_password
  patch "password", to: "password#update"

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "sign_in", to: "session#new"
  post "sign_in", to: "session#create"
  delete "logout", to: "session#destroy"

  get "/auth/google_oauth2/callback", to: "session#omniauth"
  
  get "password/reset", to: "password_reset#new"
  post "password/reset", to: "password_reset#create"
  get "password/reset/edit", to: "password_reset#edit"
  patch "password/reset/edit", to: "password_reset#update"

  get "timerinput", to: "timerecords#index"
  post "timerinput", to: "timerecords#create"

  get "timer", to: "timer#index"

  get "setcheck", to: "setcheck#index"
  post "setcheck", to: "setcheck#check"

  get "wreports", to: "wreports#index"

  get "settings", to: "settings#index", as: :settings
  patch "settings", to: "settings#update"

  get "motivation", to: "motivation#index"
  get "todo", to: "todo#index"


  root to: "main#index"
  resources :user do
    resources :events 
  end
  resources :user do
    resources :motivations 
  end
  resources :event do
    resources :todo_lists do
      member do
        patch :complete
     end
    end
  end
  resources :user do
    resources :timerecords 
  end
  resources :user do
    resources :todos 
  end
end
 