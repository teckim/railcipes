Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :foods, only: %i[index new create destroy]

  get '/public-recipes', to: 'public_recipes#index'

  root 'application#index'

  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end

  resources :foods, except: [:update]
  get 'my_recipes', to: 'recipes#my_recipes'
  get 'public_recipes', to: 'recipes#public_recipes'
  resources :general_shopping_list, only: [:index]
  
end
