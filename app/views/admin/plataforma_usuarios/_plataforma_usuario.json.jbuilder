json.extract! plataforma_usuario, :id, :nome, :senha, :plataforma_id_id, :email, :ativo, :created_at, :updated_at
json.url plataforma_usuario_url(plataforma_usuario, format: :json)
