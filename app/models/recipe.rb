class Recipe < ActiveRecord::Base

#    t.text     "instructions",       null: false
  validates :instructions, presence: true
#    t.string   "name"
  validates :name, presence: true
#    t.time     "prep_time"
  validates :prep_time, presence: true
#    t.integer  "complexity"
  validates :complexity, presence: true
  validates :products_for_recipe, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :products_for_recipe
  has_many :products, :through => :products_for_recipe
  accepts_nested_attributes_for :products
  accepts_nested_attributes_for :products_for_recipe

  def total_protein
    total = 0
    self.products_for_recipe.each do |product|
      total=total+product.quantity*product.product.protein/100
    end
    total
  end
  def total_fat
    total = 0
    self.products_for_recipe.each do |product|
      total=total+product.quantity*product.product.fat/100
    end
    total
  end
  def total_calories
    total = 0
    self.products_for_recipe.each do |product|
      total=total+product.quantity*product.product.calories/100
    end
    total
  end
  def total_carbs
    total = 0
    self.products_for_recipe.each do |product|
      total=total+product.quantity*product.product.carbs/100
    end
    total
  end
  def prep_time_text
    return self.prep_time.to_s(:time) if self.prep_time
    "n/a min"
  end
  def complexity_text
    return "easy" if self.complexity == 1
    return "medium" if self.complexity == 2 
    return "hard" if self.complexity == 3
    "n/a"
  end

  def self.search(term)
   if term
     where_statement = term.split(" ").map{ |word| 
	"(products.name like '%#{word}%' or recipes.name like '%#{word}%' or recipes.instructions like '%#{word}%' )" }.join(' and ')

     Recipe.joins(products_for_recipe: :product).where(where_statement).distinct(:recipe_id)
   else
     find(:all)
   end 
  end
  def self.search_by_products(product_list)
   if product_list
     where_statement = product_list.map{ |product_id| 
	"(products_for_recipes.product_id = #{product_id} )" }.join(' or ')

     Recipe.joins(:products_for_recipe).where(where_statement).distinct(:recipe_id)
   else
     find(:all)
   end 
  end


end
