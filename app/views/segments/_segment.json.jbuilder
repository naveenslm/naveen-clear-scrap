json.extract! segment, :id, :name, :from, :to, :distance, :time, :veh_type, :price, :min, :max, :source_id, :created_at, :updated_at
json.url segment_url(segment, format: :json)
