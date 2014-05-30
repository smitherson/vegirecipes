class AddProperPictures < ActiveRecord::Migration
  def up
	remove_column :recipes, :picture
	remove_column :products, :image
	add_attachment :recipes, :image
	add_attachment :products, :image
  end
  def down
	add_column :recipes, :picture
	add_column :products, :image
	remove_attachment :recipes, :image
	remove_attachment :products, :image

  end
end
