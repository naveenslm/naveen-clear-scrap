json.extract! source, :id, :name, :from, :to, :distance, :time, :price, :min_price, :max_price, :route_id, :created_at, :updated_at
json.url source_url(source, format: :json)
