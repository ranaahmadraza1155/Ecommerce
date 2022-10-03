json.extract! product, :id, :title, :des, :qty, :rCatageroy_id, :created_at, :updated_at
json.url product_url(product, format: :json)
