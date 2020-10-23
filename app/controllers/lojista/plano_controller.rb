class Lojista::PlanoController < ApplicationController
  layout "lojista_application"
  skip_before_action :usuario_logado
  before_action :empresa_logado
  before_action :set_plano, only: [:update, :edit, :show]
  before_action :carrega_plataforma
  def edit
  end

  def show

  end

  def update
    respond_to do |format|
      if @plano.update(plano_params)
        format.html { redirect_to lojista_plano_edit_path, notice: 'Produto atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
  def set_plano
    @plano = @empresa_logado.empresa.plano
  end

  def carrega_plataforma
    @plataforma = @empresa_logado.empresa.plano.plataforma
  end

  def plano_params
      params.require(:plano).permit(:plataforma_id, :descricao, :valor, :qtd_produto, :ativo)
  end
end
