Rails.application.routes.draw do
  resources :roles
  resources :productos
  devise_for :users, controllers: {
    sessions: 'devise/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "main#home"
end
