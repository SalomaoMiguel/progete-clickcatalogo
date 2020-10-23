class Admin::CitiesController < ApplicationController
  layout 'admin_application'
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :origem_definido

  # GET /cities
  # GET /cities.json
  # GET /cities/1
  # GET /cities/1.json
  def show
    @bairros = @city.bairros.order(:descricao)
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to admin_country_state_path(@country, @state), notice: 'Cidade criada com sucesso.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to admin_country_state_path(@country, @state), notice: 'Cidade atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to admin_country_state_path(@country, @state), notice: 'Cidade deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

  def origem_definido
    #Definindo ja um estado para cidade
    @country = Country.find(params[:country_id])
    @state = State.find(params[:state_id])
  end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:state_id, :code, :ref, :name, :ddd, :latitude, :longitude, :active)
    end
end
