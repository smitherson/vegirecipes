class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  # GET /recipes
  # GET /recipes.json
  def index
	@recipes = Recipe.search(params[:search])
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
	
	@products = Product.select(:name, :id).where(1==1)
	@recipe.products = Array.new(1, Product.new)
	@recipe.products_for_recipe = Array.new(1, ProductsForRecipe.new)
  end

  # GET /recipes/1/edit
  def edit
	@products = Product.select(:name, :id).where(1==1)
	@products_for_recipe = ProductsForRecipe.where(:recipe_id => @recipe.id)
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @products = Product.all

    @products_for_recipe = {}
    new_products_for_recipe = []
    if (params[:recipe][:products_attributes]) 
      params[:recipe][:products_attributes].each do |key, value|
          new_products_for_recipe << ProductsForRecipe.new(:quantity => value['products_for_recipe']['quantity'], 
                                                         :product_id => value['products_for_recipe']['product_id'])
      end
    end
    @recipe.products_for_recipe = new_products_for_recipe
    respond_to do |format|
      if @recipe.save
        new_products_for_recipe.each  do |pfr|
          pfr.recipe_id = @recipe.id
          pfr.save
        end
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
         ProductsForRecipe.destroy_all(:recipe_id => @recipe.id)
 
        params[:recipe][:products_attributes].each do |key, value|
          new_product_for_recipe = ProductsForRecipe.new(:quantity => value['products_for_recipe']['quantity'], 
                                                         :product_id => value['products_for_recipe']['product_id'])
	      new_product_for_recipe.recipe_id = @recipe.id
          new_product_for_recipe.save
        end

        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :instructions, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :prep_time, :complexity, :image)
    end
end
