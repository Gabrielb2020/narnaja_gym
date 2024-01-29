json.extract! producto, :id, :name, :description, :price, :created_at, :updated_at
json.url producto_url(producto, format: :json)
