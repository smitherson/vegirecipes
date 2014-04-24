json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :product, :instructions, :picture
  json.url recipe_url(recipe, format: :json)
end
