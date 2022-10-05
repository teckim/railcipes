Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :foods, only: %i[index new create destroy]

  get '/public-recipes', to: 'public_recipes#index'

  root 'application#index'
end
