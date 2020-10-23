class ApplicationController < ActionController::Base
  before_action :validate_controller
  before_action :usuario_logado

  def usuario_logado
    if session[:usuario_logado_id].nil?
      redirect_to admin_auth_autenticar_path
    else
      @usuario_logado = PlataformaUsuario.find(session[:usuario_logado_id])
    end
  end

  def empresa_logado
    if session[:empresa_logado_id].nil?
      redirect_to lojista_auth_autenticar_path
    else
      @empresa_logado = EmpresaUsuario.find(session[:empresa_logado_id])
    end
  end

  def validate_controller
    control = PermissionController.find_by_controller_name(params[:controller])
    if control.nil?
      control = PermissionController.create(controller_name: params[:controller])
    end
    action = PermissionAction.where(permission_controller_id: control.id, action_name: params[:action]).first
    if action.nil?
       PermissionAction.create(permission_controller_id: control.id, action_name: params[:action])
    end
  end

end
