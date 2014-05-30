class AddSomeFields2 < ActiveRecord::Migration
   def up
    change_column :products_for_recipes, :quantity, :integer
    add_column :recipes, :name, :string
  end
  def down
    remove_column :recipes, :name

  end

end
