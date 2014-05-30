class AddSomeFields < ActiveRecord::Migration
   def up
    change_column :products_for_recipes, :quantity, :number
    add_column :recipes, :name, :string
  end
  def down
    del_column :recipes, :name, :string

  end
end
