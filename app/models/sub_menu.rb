#encoding utf-8
#t.references :menu, foreign_key: true
#t.references :sub_menu, foreign_key: true
#t.references :permission_action, foreign_key: true
#t.string :name, null: false
#t.boolean :ajax, null: false, default: true
#t.boolean :active, null: false, default: true
class SubMenu < ApplicationRecord
  #Relacionamentos
  belongs_to :menu
  belongs_to :sub_menu, optional: true
  belongs_to :permission_action
  has_many :permission_flows
  #Validacoes
  validates :name, presence: true, length: {maximum: 255}
  validates :ajax, :active, presence: true, inclusion: {in: [true,false]}
  #CallBack
  #Escopes
end
