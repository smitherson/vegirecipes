class AddCarbsToProduct < ActiveRecord::Migration
  def up
    add_column :products, :carbs, :integer
    add_column :recipes, :prep_time, :time
    add_column :recipes, :complexity, :integer
  end
  def down
    remove_column :products, :carbs
    remove_column :recipes, :prep_time
    remove_column :recipes, :complexity
  end
end
