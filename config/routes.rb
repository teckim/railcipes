Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end
  
end
