json.extract! plano_pagamento, :id, :empresa_id, :descricao, :disponivel, :troco_ativo, :created_at, :updated_at
json.url plano_pagamento_url(plano_pagamento, format: :json)
