Rails.application.routes.draw do

  root 'static_pages#home'
  get '/new', to: 'questions#new'
  get '/quiz', to: 'quiz_mode#quiz'
  get '/new_quiz', to: 'quiz_mode#new_quiz'
  post '/check_quiz', to: 'quiz_mode#check_quiz'
  post '/new', to: 'questions#create'
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
