class Lojista::PanelController < ApplicationController
  layout "lojista_application"
  skip_before_action :usuario_logado
  before_action :empresa_logado
  def visao_geral
  end
  def editar_loja
    @empresa_seguimentos = EmpresaSeguimento.order(:descricao)
    @planos = Plano.where(ativo: true).order(:descricao)
    if request.patch?
      flash[:notice] = 'Empresa atualizado com sucesso.' if @empresa_logado.empresa.update(empresa_params)
    end
  end
  def editar_perfil
    if request.patch?
      flash[:notice] = 'Conta atualizado com sucesso.' if @empresa_logado.update(empresa_usuario_params)
    end
  end
 private
  def empresa_params
    params.require(:empresa).permit(:razao, :cnpj_cpf, :endereco, :cidade, :empresa_seguimento_id, :sobre, :cor_layout, :fb_url, :insta_url, :pint_url, :web_site, :telefone, :celular, :email, :loja, :logomarca, :plano_id, :cor_fonte)
  end
  def empresa_usuario_params
    params.require(:empresa_usuario).permit(:avatar, :nome, :email, :senha, :telefone)
  end
end