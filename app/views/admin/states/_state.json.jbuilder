json.extract! state, :id, :country_id, :code, :name, :acronym, :active, :created_at, :updated_at
json.url state_url(state, format: :json)
