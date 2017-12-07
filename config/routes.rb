Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :quizzes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quiz_questions, only: :show do
    resources :quiz_answers, only: :create
    member do
      get :show_question
      get :show_answers
      get :show_correct_answer
      get :show_wait_room
    end
  end

  resources :rounds, only: :show
end
