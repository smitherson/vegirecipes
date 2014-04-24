json.array!(@products) do |product|
  json.extract! product, :id, :name, :image, :protein, :fat, :fiber, :calories
  json.url product_url(product, format: :json)
end
