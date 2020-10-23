#encoding utf-8
#t.string :controller_name, null: false
class PermissionController < ApplicationRecord
  #Relaqcionamentos
  has_many :permission_actions
  has_many :sub_menus
  #Validacoes
  validates :controller_name, presence: true
  #CallBacks
  #Escopes
end
