Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "main#index"

  get "/about-us-is-a-rlly-long-url-that-keeps-on-geting-longer-and-longer-and-filling-up-space-more-than-it-should", to: "about#index", as: :about

  # Defines the root path route ("/")
  # root "articles#index"
end
