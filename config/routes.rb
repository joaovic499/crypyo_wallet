Rails.application.routes.draw do
  get 'welcome/index'
  resources :coins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  # Defines the root path route ("/")
  # root "articles#index"
end
