json.extract! empresa_usuario, :id, :empresa_id, :nome, :email, :email_validado, :senha, :telefone, :created_at, :updated_at
json.url empresa_usuario_url(empresa_usuario, format: :json)
