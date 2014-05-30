json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :instructions, :image_file_name, :image_content_type, :image_file_size, :image_updated_at
  json.url recipe_url(recipe, format: :json)
end
