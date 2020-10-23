class Admin::EmpresasController < ApplicationController
  layout 'admin_application'
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :carrega_empresa_seguimento_and_plano

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @empresa_usuarios = @empresa.empresa_usuarios.order(:nome)
    @produto_categoriums = @empresa.produto_categoriums.order(:descricao)
    @plano_pagamentos = @empresa.plano_pagamentos.order(:descricao)
    @produtos = @empresa.produtos.order(:descricao)
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to [:admin, @empresa], notice: 'Empresa criado com sucesso.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to [:admin, @empresa], notice: 'Empresa atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresas_url, notice: 'Empresa deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

  def carrega_empresa_seguimento_and_plano
    @empresa_seguimentos = EmpresaSeguimento.where(ativo: true)
    @planos = Plano.where(ativo:true)
  end
    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:razao, :cnpj_cpf, :endereco, :cidade, :empresa_seguimento_id, :sobre, :cor_layout, :fb_url, :insta_url, :pint_url, :web_site, :telefone, :celular, :email, :loja, :logomarca, :plano_id, :cor_fonte)
    end
end
