json.extract! city, :id, :state_id, :code, :ref, :name, :ddd, :latitude, :longitude, :active, :created_at, :updated_at
json.url city_url(city, format: :json)
