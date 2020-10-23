#encoding utf-8
#t.references :sub_menu, foreign_key: true
#t.string :name, null:false
class PermissionFlow < ApplicationRecord
  #Relacionamentos
  has_many :permission_flow_actions
  belongs_to :sub_menu
  #Validacoes
  validates :name, presence: true, length: {maximum: 255}
end
