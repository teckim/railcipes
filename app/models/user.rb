class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: :user_id, dependent: :destroy
  has_many :foods, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { in: 3..10 }

  def general_food_list
    @general_food_list = Food
      .includes(:recipe_foods)
      .includes(:recipes)
      .where({ recipes: { user_id: id } })
      .where.not(user_id: id)
  end
end
