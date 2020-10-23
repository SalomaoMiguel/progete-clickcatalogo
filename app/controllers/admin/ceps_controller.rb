class Admin::CepsController < ApplicationController
  layout 'admin_application'
  before_action :set_cep, only: [:show, :edit, :update, :destroy]
  before_action :origem_definido

  # GET /ceps
  # GET /ceps.json
  def index
    @ceps = Cep.all
  end

  # GET /ceps/1
  # GET /ceps/1.json
  def show
  end

  # GET /ceps/new
  def new
    @cep = Cep.new
  end

  # GET /ceps/1/edit
  def edit
  end

  # POST /ceps
  # POST /ceps.json
  def create
    @cep = Cep.new(cep_params)

    respond_to do |format|
      if @cep.save
        format.html { redirect_to admin_country_state_city_bairro_path(@country, @state, @city, @bairro), notice: 'Cep was successfully created.' }
        format.json { render :show, status: :created, location: @cep }
      else
        format.html { render :new }
        format.json { render json: @cep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceps/1
  # PATCH/PUT /ceps/1.json
  def update
    respond_to do |format|
      if @cep.update(cep_params)
        format.html { redirect_to admin_country_state_city_bairro_path(@country, @state, @city, @bairro), notice: 'Cep was successfully updated.' }
        format.json { render :show, status: :ok, location: @cep }
      else
        format.html { render :edit }
        format.json { render json: @cep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceps/1
  # DELETE /ceps/1.json
  def destroy
    @cep.destroy
    respond_to do |format|
      format.html { redirect_to admin_country_state_city_bairro_path(@country, @state, @city, @bairro, @cep), notice: 'Cep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cep
      @cep = Cep.find(params[:id])
    end

  def origem_definido
    @country = Country.find(params[:country_id])
    @state = State.find(params[:state_id])
    @city = City.find(params[:city_id])
    @bairro = Bairro.find(params[:bairro_id])
  end

    # Only allow a list of trusted parameters through.
    def cep_params
      params.require(:cep).permit(:bairro_id, :cep, :ref, :tipo, :logradouro, :latitude, :longitude, :active)
    end
end
