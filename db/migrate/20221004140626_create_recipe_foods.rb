class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity

      t.references :recipe
      t.references :food

      t.timestamps
    end
  end
end
