class Admin::SettingPerfilController < ApplicationController
  layout 'admin_application'
  before_action :set_plataforma_usuario, only: [:edit, :update]
  before_action :origem_plataforma
  def index
  end
  def edit
  end
  def update
    respond_to do |format|
      if @plataforma_usuario.update(plataforma_usuario_params)
        format.html { redirect_to admin_panel_visao_geral_path, notice: 'Plataforma Atualizado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @plataforma_usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_plataforma_usuario
    @plataforma_usuario = @usuario_logado
  end
  def origem_plataforma
    @plataforma = @usuario_logado.plataforma
  end
  def plataforma_usuario_params
    params.require(:plataforma_usuario).permit(:nome, :senha, :plataforma_id, :email, :ativo, :avatar)
  end
end
