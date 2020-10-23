#encoding utf-8
#t.references :group, foreing_key: true
#t.references :permission_flow, foreing_key: true
class GroupPermissionFlow < ApplicationRecord
  #Relacionamentos
  belongs_to :group
  belongs_to :permission_flow
end
