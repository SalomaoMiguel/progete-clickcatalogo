class Admin::PeriodosController < ApplicationController
  layout 'admin_application'
  before_action :set_periodo, only: [:show, :edit, :update, :destroy]
  before_action :carrega_plataforma

  # GET /periodos
  # GET /periodos.json
  def index
    @periodos = Periodo.all
  end

  # GET /periodos/1
  # GET /periodos/1.json
  def show
  end

  # GET /periodos/new
  def new
    @periodo = Periodo.new
  end

  # GET /periodos/1/edit
  def edit
  end

  # POST /periodos
  # POST /periodos.json
  def create
    @periodo = Periodo.new(periodo_params)

    respond_to do |format|
      if @periodo.save
        format.html { redirect_to [:admin, @periodo], notice: 'Periodo criado com sucesso.' }
        format.json { render :show, status: :created, location: @periodo }
      else
        format.html { render :new }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /periodos/1
  # PATCH/PUT /periodos/1.json
  def update
    respond_to do |format|
      if @periodo.update(periodo_params)
        format.html { redirect_to [:admin, @periodo], notice: 'Periodo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @periodo }
      else
        format.html { render :edit }
        format.json { render json: @periodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /periodos/1
  # DELETE /periodos/1.json
  def destroy
    @periodo.destroy
    respond_to do |format|
      format.html { redirect_to admin_periodos_url, notice: 'Periodo deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_periodo
      @periodo = Periodo.find(params[:id])
    end

  def carrega_plataforma
    @plataformas = Plataforma.all
  end
    # Only allow a list of trusted parameters through.
    def periodo_params
      params.require(:periodo).permit(:periodo, :dt_ini, :dt_fin, :plataforma_id)
    end
end
