Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :foods, only: %i[index new create destroy]

  root 'application#index'
end
