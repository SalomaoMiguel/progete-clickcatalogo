json.extract! cep, :id, :bairro_id, :ref, :tipo, :logadouro, :latitude, :longitude, :active, :created_at, :updated_at
json.url cep_url(cep, format: :json)
