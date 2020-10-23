class Admin::EmpresaSeguimentosController < ApplicationController
layout 'admin_application'
  before_action :set_empresa_seguimento, only: [:show, :edit, :update, :destroy]

  # GET /empresa_seguimentos
  # GET /empresa_seguimentos.json
  def index
    @empresa_seguimentos = EmpresaSeguimento.all
  end

  # GET /empresa_seguimentos/1
  # GET /empresa_seguimentos/1.json
  def show
  end

  # GET /empresa_seguimentos/new
  def new
    @empresa_seguimento = EmpresaSeguimento.new
  end

  # GET /empresa_seguimentos/1/edit
  def edit
  end

  # POST /empresa_seguimentos
  # POST /empresa_seguimentos.json
  def create
    @empresa_seguimento = EmpresaSeguimento.new(empresa_seguimento_params)

    respond_to do |format|
      if @empresa_seguimento.save
        format.html { redirect_to [:admin, @empresa_seguimento], notice: 'Empresa seguimento criado com sucesso.' }
        format.json { render :show, status: :created, location: @empresa_seguimento }
      else
        format.html { render :new }
        format.json { render json: @empresa_seguimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresa_seguimentos/
  # PATCH/PUT /empresa_seguimentos/1.json
  def update
    respond_to do |format|
      if @empresa_seguimento.update(empresa_seguimento_params)
        format.html { redirect_to [:admin, @empresa_seguimento], notice: 'Empresa seguimento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa_seguimento }
      else
        format.html { render :edit }
        format.json { render json: @empresa_seguimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresa_seguimentos/1
  # DELETE /empresa_seguimentos/1.json
  def destroy
    @empresa_seguimento.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresa_seguimentos_url, notice: 'Empresa seguimento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa_seguimento
      @empresa_seguimento = EmpresaSeguimento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_seguimento_params
      params.require(:empresa_seguimento).permit(:descricao, :ativo)
    end
end
