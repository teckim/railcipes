class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.boolean :public, defaut: true
      t.integer :preparation_time
      t.integer :cooking_time

      t.references :user

      t.timestamps
    end
  end
end
