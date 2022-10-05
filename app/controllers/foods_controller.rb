class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new; end

  def create
    @food = Food.new food_params
    @food.user = current_user

    if @food.valid?
      @food.save

      redirect_to foods_path
    else
      redirect_to new_food_path
    end
  end

  def destroy
    Food.destroy(params[:id])

    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
