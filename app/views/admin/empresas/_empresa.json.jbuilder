json.extract! empresa, :id, :razao, :cnpj_cpf, :endereco, :cidade, :empresa_seguimento_id, :sobre, :cor_layout, :fb_url, :insta_url, :pint_url, :web_site, :telefone, :celular, :email, :loja_id, :logomarca, :plano_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
