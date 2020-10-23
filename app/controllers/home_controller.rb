class HomeController < ApplicationController
  layout false
  skip_before_action :usuario_logado
  def index
    @planos = Plano.where(ativo: true)
  end
  def visualizar_empresa
    @empresa = Empresa.find_by_loja(params[:chave])
    if @empresa.present?
      if params[:cat_id].blank?
        @produtos = @empresa.produtos.where(disponivel: true).order(:preco)
      else
        @produtos = @empresa.produtos.where(disponivel: true, produto_categorium_id: params[:cat_id].to_i).order(:preco)
      end
    else
      @produtos = []
    end
  end
  end
