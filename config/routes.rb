Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  resources :quizzes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quiz_questions, only: :show
  resources :quiz_answers, only: :create
  resources :rounds, only: :show
end
