#encoding utf-8
#t.references :permission_controller, foreign_key: true
#t.string :action_name
#t.boolean :action_controlled
#t.boolean :action_link
class PermissionAction < ApplicationRecord
  #Relaqcionamentos
  belongs_to :permission_controller
  has_many :sub_menus
  #Validacoes
  validates :action_name, presence: true, length: {maximum: 255}
  validates :action_controlled, :action_link, inclusion: {in: [true, false]}
  #CallBacks
  before_create :seta_link
  def seta_link
    if self.action_name == 'index'
      self.action_link = true
    end
  end
  #Escopes
  # Metodos de Classe
  def caminho
    "#{self.permission_controller.controller_name}/#{self.action_name}"
  end
end
