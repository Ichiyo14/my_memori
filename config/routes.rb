Rails.application.routes.draw do

  root to: 'home#index'
  get "test", to: "home#test", as: "test"

  get 'users/:id/questions', to: 'questionnaires#index', as: 'questions'
  get 'users/:id/questions/:id', to: 'questionnaires#show' ,as: :show_question
  get 'questions/new', to: 'questionnaire_forms#new'
  post 'questions', to: 'questionnaire_forms#create' ,as: :create_question
  get 'questions/:id/edit', to: 'questionnaires#:id#edit'
  get 'questions/:id/answer', to: 'answers#new', as: :new_answer

  resources :questionnaires, only: [:show, :update, :destroy, :edit, :new]


  devise_scope :user do
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    get "sign_up" => "devise/registrations#new", as: :new_user_registration
  end
  devise_for :users, skip: [:sessions]

end
