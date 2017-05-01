Rails.application.routes.draw do

  get 'users/new'

  root 'static_pages#home'
  get '/new', to: 'questions#new'
  get '/quiz', to: 'quiz_mode#quiz'
  get '/new_quiz', to: 'quiz_mode#new_quiz'
  get '/new_user', to: 'users#new'
  post '/check_quiz', to: 'quiz_mode#check_quiz'
  post '/new', to: 'questions#create'
  post '/signup',  to: 'users#create'
  resources :questions
  resources :users
end
