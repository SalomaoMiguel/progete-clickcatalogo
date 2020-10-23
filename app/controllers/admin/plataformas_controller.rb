class Admin::PlataformasController < ApplicationController
  layout 'admin_application'
  before_action :set_plataforma, only: [:show, :edit, :update, :destroy]

  # GET /plataformas
  # GET /plataformas.json
  def index
    @plataformas = Plataforma.all
  end

  # GET /plataformas/1
  # GET /plataformas/1.json
  def show
    @plataforma_usuarios = @plataforma.plataforma_usuarios.order(:nome)
  end

  # GET /plataformas/new
  def new
    @plataforma = Plataforma.new
  end

  # GET /plataformas/1/edit
  def edit
  end

  # POST /plataformas
  # POST /plataformas.json
  def create
    @plataforma = Plataforma.new(plataforma_params)

    respond_to do |format|
      if @plataforma.save
        format.html { redirect_to admin_plataforma_path(@plataforma), notice: 'Plataforma criada com sucesso.' }
        format.json { render :show, status: :created, location: @plataforma }
      else
        format.html { render :new }
        format.json { render json: @plataforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plataformas/1
  # PATCH/PUT /plataformas/1.json
  def update
    respond_to do |format|
      if @plataforma.update(plataforma_params)
        format.html { redirect_to admin_plataforma_path(@plataforma), notice: 'Plataforma atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @plataforma }
      else
        format.html { render :edit }
        format.json { render json: @plataforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plataformas/1
  # DELETE /plataformas/1.json
  def destroy
    @plataforma.destroy
    respond_to do |format|
      format.html { redirect_to admin_plataformas_url, notice: 'Plataforma deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plataforma
      @plataforma = Plataforma.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plataforma_params
      params.require(:plataforma).permit(:descricao, :desenvolvedora, :cnpj)
    end
end
