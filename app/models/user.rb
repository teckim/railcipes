class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :recipes, foreign_key: :user_id, dependent: :destroy
  has_many :foods, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { in: 3..10 }
end
