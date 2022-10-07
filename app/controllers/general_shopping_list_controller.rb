class GeneralShoppingListController < ApplicationController
  def index
    @general_shopping_items = current_user.general_food_list
    @total_price = @general_shopping_items.sum('price * recipe_foods.quantity')
  end
end
