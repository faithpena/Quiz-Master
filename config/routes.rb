Rails.application.routes.draw do
  root 'questions#show'
  get '/new', to: 'questions#new'

  post '/new', to: 'questions#create'
  resources :questions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
