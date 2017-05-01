Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get '/new', to: 'questions#new'
  get '/quiz', to: 'quiz_mode#quiz'
  get '/new_quiz', to: 'quiz_mode#new_quiz'
  get '/new_user', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  post '/check_quiz', to: 'quiz_mode#check_quiz'
  post '/new', to: 'questions#create'
  post '/signup',  to: 'users#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :questions
  resources :users
end
