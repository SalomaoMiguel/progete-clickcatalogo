class Admin::PanelController < ApplicationController
  layout "admin_application"
  before_action :origem_produto

  def visao_geral
    @produtos = Produto.all
    @produto_categoriums = ProdutoCategorium.all
    @empresas = Empresa.all
  end

  def origem_produto
    @produto = Produto.find_by_id(params[:produto_id])
  end
end
