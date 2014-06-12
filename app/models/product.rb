class Product < ActiveRecord::Base
#    t.string   "name",                                        null: false
  validates :name, presence: true
#    t.decimal  "protein",            precision: 10, scale: 0, null: false
  validates :protein, presence: true
#    t.decimal  "fat",                precision: 10, scale: 0, null: false
  validates :fat, presence: true
#    t.decimal  "fiber",              precision: 10, scale: 0, null: false
  validates :fiber, presence: true
#    t.decimal  "calories",           precision: 10, scale: 0, null: false
  validates :calories, presence: true
#    t.integer  "carbs"
  validates :carbs, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :products_for_recipe
  has_many :recipes, :through => :products_for_recipe
 
end
