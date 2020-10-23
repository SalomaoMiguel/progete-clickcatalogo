class Admin::StatesController < ApplicationController
  layout 'admin_application'
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :origem_definido
  before_action :carregar_paises
  # GET /states/1
  # GET /states/1.json
  def show
    @cities = @state.cities.order(:name)
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html { redirect_to admin_country_path(@country, @state), notice: 'Estado criado com sucesso.' }
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html { redirect_to admin_country_path(@country, @state), notice: 'Estado atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html { redirect_to admin_country_path(@country, @state), notice: 'Estado deletetado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

  def carregar_paises
    @countries = Country.where(active: true)
  end
  def origem_definido
    #DEF Pais Estado
    @country = Country.find(params[:country_id])
  end

    # Only allow a list of trusted parameters through.
    def state_params
      params.require(:state).permit(:country_id, :code, :name, :acronym, :active)
    end
end
