class Admin::AuthController < ApplicationController
  layout false
  skip_before_action :usuario_logado

  def autenticar
    if request.post?
      @usuario_logado = PlataformaUsuario.autenticar(params[:email], params[:senha])
      if @usuario_logado
        session[:usuario_logado_id] = @usuario_logado.id
        redirect_to admin_panel_visao_geral_path
      else
        flash[:error] = "Email ou senha inválido. Tente novamente"
      end
    end
  end

  def sair
    session.destroy
    redirect_to admin_auth_autenticar_path
  end
end
