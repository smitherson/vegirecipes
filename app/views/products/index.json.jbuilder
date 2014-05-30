json.array!(@products) do |product|
  json.extract! product, :id, :name, :protein, :fat, :fiber, :calories, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  json.url product_url(product, format: :json)
end
