class Admin::PlanoPagamentosController < ApplicationController
layout 'admin_application'
  before_action :set_plano_pagamento, only: [ :edit, :update, :destroy]
  before_action :origem_empresa
  # GET /plano_pagamentos/new
  def new
    @plano_pagamento = PlanoPagamento.new
  end

  # GET /plano_pagamentos/1/edit
  def edit
  end

  # POST /plano_pagamentos
  # POST /plano_pagamentos.json
  def create
    @plano_pagamento = PlanoPagamento.new(plano_pagamento_params)
    @plano_pagamento.empresa = @empresa

    respond_to do |format|
      if @plano_pagamento.save
        format.html { redirect_to [:admin, @empresa], notice: 'Plano pagamento criado com sucesso.' }
        format.json { render :show, status: :created, location: @plano_pagamento }
      else
        format.html { render :new }
        format.json { render json: @plano_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plano_pagamentos/1
  # PATCH/PUT /plano_pagamentos/1.json
  def update
    respond_to do |format|
      if @plano_pagamento.update(plano_pagamento_params)
        format.html { redirect_to [:admin, @empresa], notice: 'Plano pagamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @plano_pagamento }
      else
        format.html { render :edit }
        format.json { render json: @plano_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plano_pagamentos/1
  # DELETE /plano_pagamentos/1.json
  def destroy
    @plano_pagamento.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresa_path(@empresa), notice: 'Plano pagamento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plano_pagamento
      @plano_pagamento = PlanoPagamento.find(params[:id])
    end

    def origem_empresa
      @empresa = Empresa.find(params[:empresa_id])
    end
    # Only allow a list of trusted parameters through.
    def plano_pagamento_params
      params.require(:plano_pagamento).permit(:descricao, :disponivel, :troco_ativo)
    end
end
