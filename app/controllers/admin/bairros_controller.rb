class Admin::BairrosController < ApplicationController
  layout 'admin_application'
  before_action :set_bairro, only: [:show, :edit, :update, :destroy]
  before_action :origem_definido

  # GET /bairros
  # GET /bairros.json
  # GET /bairros/1
  # GET /bairros/1.json
  def show
    @ceps = @bairro.ceps.order(:cep)
  end

  # GET /bairros/new
  def new
    @bairro = Bairro.new
  end

  # GET /bairros/1/edit
  def edit
  end

  # POST /bairros
  # POST /bairros.json
  def create
    @bairro = Bairro.new(bairro_params)

    respond_to do |format|
      if @bairro.save
        format.html { redirect_to admin_country_state_city_path(@country, @state, @city), notice: 'Bairro criado com sucesso.' }
        format.json { render :show, status: :created, location: @bairro }
      else
        format.html { render :new }
        format.json { render json: @bairro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bairros/1
  # PATCH/PUT /bairros/1.json
  def update
    respond_to do |format|
      if @bairro.update(bairro_params)
        format.html { redirect_to admin_country_state_city_path(@country, @state, @city), notice: 'Bairro atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @bairro }
      else
        format.html { render :edit }
        format.json { render json: @bairro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bairros/1
  # DELETE /bairros/1.json
  def destroy
    @bairro.destroy
    respond_to do |format|
      format.html { redirect_to admin_country_state_city_path(@country, @state, @city), notice: 'Bairro deletado  com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bairro
      @bairro = Bairro.find(params[:id])
    end

  def origem_definido
    @country = Country.find(params[:country_id])
    @state = State.find(params[:state_id])
    @city = City.find(params[:city_id])
  end

    # Only allow a list of trusted parameters through.
    def bairro_params
      params.require(:bairro).permit(:city_id, :ref, :descricao, :latitude, :longitude)
    end
end
