class CreateProductsForRecipe < ActiveRecord::Migration
  def change
    create_table :products_for_recipes do |t|
      t.belongs_to :recipe
      t.belongs_to :product
      t.datetime :quantity 
      t.timestamps
    end
  end
end
