#encoding utf-8
class PermissionFlowAction < ApplicationRecord
  #Relacionamentos
  belongs_to :permission_flow
  belongs_to :permission_action
  #Validacoes
  # CallBacks
  # Escopes
end
