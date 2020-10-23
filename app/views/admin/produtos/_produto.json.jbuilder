json.extract! produto, :id, :empresa_id, :produto_categoria_id, :descricao, :especificacao, :preco, :promocao, :disponivel, :deletado, :created_at, :updated_at
json.url produto_url(produto, format: :json)
