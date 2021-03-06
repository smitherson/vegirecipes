require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { calories: @product.calories, fat: @product.fat, fiber: @product.fiber, image_content_type: @product.image_content_type, image_file_name: @product.image_file_name, image_file_size: @product.image_file_size, image_updated_at: @product.image_updated_at, name: @product.name, protein: @product.protein }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { calories: @product.calories, fat: @product.fat, fiber: @product.fiber, image_content_type: @product.image_content_type, image_file_name: @product.image_file_name, image_file_size: @product.image_file_size, image_updated_at: @product.image_updated_at, name: @product.name, protein: @product.protein }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
