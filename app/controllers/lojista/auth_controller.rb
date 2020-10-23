class Lojista::AuthController < ApplicationController
  layout false
  skip_before_action :usuario_logado

  def autenticar
    if request.post?
      @empresa_logado = EmpresaUsuario.autenticar(params[:email], params[:senha])
      if @empresa_logado
        session[:empresa_logado_id] = @empresa_logado.id
        redirect_to lojista_panel_visao_geral_path
      else
        flash[:error] = "Email ou senha inválido. Tente novamente"
      end
    end
  end

  def sair
    session.destroy
    redirect_to lojista_auth_autenticar_path
  end
end