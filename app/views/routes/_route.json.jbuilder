json.extract! route, :id, :from, :to, :created_at, :updated_at
json.url route_url(route, format: :json)
