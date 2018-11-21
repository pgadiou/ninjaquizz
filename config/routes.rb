Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root :to => "pages#home"
  resources :quizzes do
    member do
      get :show_results
    end
  end

put 'admins/:id', to: 'admins#select_quiz', as: :select_quiz

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quiz_questions, only: :show do
    resources :quiz_answers, only: :create
    member do
      get :show_question
      get :show_answers
      get :show_correct_answer
    end
  end
  resources :admins

  resources :questions

  resources :answers

  resources :rounds, only: :show do
    member do
      get :show_round_results
    end
  end
  mount ActionCable.server => "/cable"
end
