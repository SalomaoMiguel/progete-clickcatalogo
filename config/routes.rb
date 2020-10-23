Rails.application.routes.draw do
  namespace :lojista do
    get 'plano/edit'
    patch 'plano/update'
    get 'plano/show'
  end
  namespace :admin do
    get 'setting_perfil/index'
    get 'setting_perfil/edit'
    patch 'setting_perfil/update'
  end
  namespace :lojista do
    get 'produto/index'
    get 'produto/new'
    get 'produto/show'
    post 'produto/create'
    get 'produto/edit'
    patch 'produto/update'
    delete 'produto/destroy'
  end
  namespace :lojista do
    get 'plano_pagamentos/index'
    get 'plano_pagamentos/new'
    get 'plano_pagamentos/edit'
    post 'plano_pagamentos/create'
    patch 'plano_pagamentos/update'
    delete 'plano_pagamentos/destroy'
  end
  namespace :lojista do
    get 'produto_categorias/index'
    get 'produto_categorias/edit'
    get 'produto_categorias/new'
    post 'produto_categorias/create'
    patch 'produto_categorias/update'
    delete 'produto_categorias/destroy'
  end
  namespace :lojista do
    root 'auth#autenticar'
    get 'auth/autenticar'
    post 'auth/autenticar'
    get 'auth/sair'
  end
  root 'home#index'
  namespace :lojista do
    get 'panel/visao_geral'
    get 'panel/editar_loja'
    patch 'panel/editar_loja'
    get 'panel/editar_perfil'
    patch 'panel/editar_perfil'
  end
  namespace :admin do
    get 'panel/visao_geral'
  end
  namespace :admin do
    root 'auth#autenticar'
    get 'auth/autenticar'
    post 'auth/autenticar'
    get 'auth/sair'
    resources :groups
    resources :permission_flow_actions
    resources :permission_flows
    resources :sub_menus
    resources :menus
    resources :countries do
      resources :states do
        resources :cities do
          resources :bairros do
            resources :ceps
          end
        end
      end
    end
    resources :plataformas do
      resources :plataforma_usuarios, except: :index
    end
    resources :planos
    resources :empresa_seguimentos
    resources :periodos
    resources :empresas do
      resources :empresa_usuarios, except: :index
      resources :produto_categoria, except: [:index, :show]
      resources :plano_pagamentos, except: [:index, :show]
      resources :produtos, except: :index
    end

  end
  get 'home/index'
  get 'home/visualizar_empresa'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
