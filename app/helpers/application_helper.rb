module ApplicationHelper
  def  error_messages_for(resolucao)
    render "layouts/shared/error_message_for", resolucao: resolucao
  end
end
