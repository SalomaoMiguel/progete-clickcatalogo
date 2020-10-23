class Lojista::PlanoPagamentosController < ApplicationController
  layout "lojista_application"
  skip_before_action :usuario_logado
  before_action :empresa_logado
  before_action :set_plano_pagamento, only:[:edit, :update, :destroy]
  def index
  end

  def new
    @plano_pagamento = PlanoPagamento.new
  end

  def edit
  end

  def create
    @plano_pagamento = PlanoPagamento.new(plano_pagamento_params)
    @plano_pagamento.empresa = @empresa_logado.empresa
    respond_to do |format|
      if @plano_pagamento.save
        format.html { redirect_to lojista_plano_pagamentos_index_path, notice: 'Plano de Pagamento criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @plano_pagamento.update(plano_pagamento_params)
        format.html { redirect_to lojista_plano_pagamentos_index_path, notice: 'Plano de Pagamento atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @plano_pagamento.destroy
    redirect_to lojista_plano_pagamentos_index_path, notice: 'Plano de Pagamento deletado com sucesso.'
  end

  private
  def set_plano_pagamento
    @plano_pagamento = @empresa_logado.empresa.plano_pagamentos.find_by_id(params[:plano_pagamento_id])
  end
  def plano_pagamento_params
    params.require(:plano_pagamento).permit(:descricao, :disponivel, :troco_ativo)
  end
end
