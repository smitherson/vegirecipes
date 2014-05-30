class Recipe < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :products_for_recipe
  has_many :products, :through => :products_for_recipe
  accepts_nested_attributes_for :products
  accepts_nested_attributes_for :products_for_recipe

end
