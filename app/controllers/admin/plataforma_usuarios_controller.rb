class Admin::PlataformaUsuariosController < ApplicationController
  layout 'admin_application'
  before_action :set_plataforma_usuario, only: [:show, :edit, :update, :destroy]
  before_action :origem_plataforma

  # GET /plataforma_usuarios/1
  # GET /plataforma_usuarios/1.json
  def show
  end

  # GET /plataforma_usuarios/new
  def new
    @plataforma_usuario = PlataformaUsuario.new
  end

  # GET /plataforma_usuarios/1/edit
  def edit
  end

  # POST /plataforma_usuarios
  # POST /plataforma_usuarios.json
  def create
    @plataforma_usuario = PlataformaUsuario.new(plataforma_usuario_params)

    respond_to do |format|
      if @plataforma_usuario.save
        format.html { redirect_to [:admin , @plataforma, @plataforma_usuario], notice: 'Plataforma usuario was successfully created.' }
        format.json { render :show, status: :created, location: @plataforma_usuario }
      else
        format.html { render :new }
        format.json { render json: @plataforma_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plataforma_usuarios/1
  # PATCH/PUT /plataforma_usuarios/1.json
  def update
    respond_to do |format|
      if @plataforma_usuario.update(plataforma_usuario_params)
        format.html { redirect_to [:admin , @plataforma, @plataforma_usuario], notice: 'Plataforma usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @plataforma_usuario }
      else
        format.html { render :edit }
        format.json { render json: @plataforma_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plataforma_usuarios/1
  # DELETE /plataforma_usuarios/1.json
  def destroy
    @plataforma_usuario.destroy
    respond_to do |format|
      format.html { redirect_to admin_plataforma_path(@plataforma, @plataforma_usuario), notice: 'Plataforma usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plataforma_usuario
      @plataforma_usuario = PlataformaUsuario.find(params[:id])
    end

    def origem_plataforma
      @plataforma = Plataforma.find(params[:plataforma_id])
    end
    # Only allow a list of trusted parameters through.
    def plataforma_usuario_params
      params.require(:plataforma_usuario).permit(:nome, :senha, :plataforma_id, :email, :ativo, :avatar)
    end
end
