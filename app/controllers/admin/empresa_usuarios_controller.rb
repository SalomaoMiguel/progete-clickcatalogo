class Admin::EmpresaUsuariosController < ApplicationController
  layout 'admin_application'
  before_action :set_empresa_usuario, only: [:show, :edit, :update, :destroy]
  before_action :origem_empresa
  # GET /empresa_usuarios/1
  # GET /empresa_usuarios/1.json
  def show
  end
  # GET /empresa_usuarios/new
  def new
    @empresa_usuario = EmpresaUsuario.new
  end
  # GET /empresa_usuarios/1/edit
  def edit
  end
  # POST /empresa_usuarios
  # POST /empresa_usuarios.json
  def create
    @empresa_usuario = EmpresaUsuario.new(empresa_usuario_params)
    @empresa_usuario.empresa = @empresa
    respond_to do |format|
      if @empresa_usuario.save
        format.html { redirect_to [:admin, @empresa,  @empresa_usuario], notice: 'Empresa usuario criado com sucesso.' }
        format.json { render :show, status: :created, location: @empresa_usuario }
      else
        format.html { render :new }
        format.json { render json: @empresa_usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /empresa_usuarios/1
  # PATCH/PUT /empresa_usuarios/1.json
  def update
    respond_to do |format|
      if @empresa_usuario.update(empresa_usuario_params)
        format.html { redirect_to [:admin, @empresa, @empresa_usuario], notice: 'Empresa atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa_usuario }
      else
        format.html { render :edit }
        format.json { render json: @empresa_usuario.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /empresa_usuarios/1
  # DELETE /empresa_usuarios/1.json
  def destroy
    @empresa_usuario.destroy
    respond_to do |format|
      format.html { redirect_to admin_empresa_url(@empresa), notice: 'Empresa deletado com sucesso.' }
      format.json { head :no_content }
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_empresa_usuario
    @empresa_usuario = EmpresaUsuario.find(params[:id])
  end
  def origem_empresa
    @empresa = Empresa.find(params[:empresa_id])
  end
  # Only allow a list of trusted parameters through.
  def empresa_usuario_params
    params.require(:empresa_usuario).permit(:avatar, :nome, :email, :senha, :telefone)
  end
end
