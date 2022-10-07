Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :foods, only: %i[index new create destroy]

  get 'public-recipes', to: 'public_recipes#index'
  get 'general-shopping-list', to: 'general_shopping_list#index'

  root 'application#index'

  resources :recipes do
    resources :recipe_foods, only: [:create, :destroy]
  end

  resources :foods, except: [:update]
  get 'my_recipes', to: 'recipes#my_recipes'
  
  resources :general_shopping_list, only: [:index]
  
end
