class Admin::CountriesController < ApplicationController
  layout 'admin_application'
  before_action :set_country, only: [:show, :edit, :update, :destroy]


  # GET /countries
  # GET /countries.json
  def index
    if params[:query] == ''
      @countries = Country.all
    else
      @countries = Country.where('name LIKE ?', "%#{params[:query]}%")
    end
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    @states = @country.states
  end

  # GET /countries/new
  def new
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to [:admin, @country], notice: 'País criado com sucesso.' }
        format.json { render :show, status: :created, location: @country }
      else
        format.html { render :new }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to [:admin, @country], notice: 'País atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy
    respond_to do |format|
      format.html { redirect_to admin_countries_url, notice: 'País deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:name, :acronym, :active, :code)
    end
end
