class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false 
      t.string :image, :null => false
      t.decimal :protein, :null => false
      t.decimal :fat, :null => false
      t.decimal :fiber, :null => false 
      t.decimal :calories, :null => false 

      t.timestamps
    end
  end
end
