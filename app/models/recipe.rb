class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, presence: true

  def self.public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def total_price
    @total_price ||= recipe_foods.reduce(0) do |sum, recipe_food|
      sum + (recipe_food.quantity * recipe_food.food.price)
    end
  end
end
