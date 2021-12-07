Rails.application.routes.draw do
  root to: 'home#index'
  get "test", to: "home#test", as: "test"
end
