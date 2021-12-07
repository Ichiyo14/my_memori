Rails.application.routes.draw do
  root to: 'home#index'
  get "test", to: "home#test", as: "test"

  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    get "sign_up" => "devise/registrations#new", as: :new_user_registration
  end
  devise_for :users, skip: [:sessions]

end
