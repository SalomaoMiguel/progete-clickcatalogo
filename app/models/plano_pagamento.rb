#encoding utf-8
#t.references :empresa, foreign_key: true, null: false
#t.string :descricao, null: false
#t.boolean :disponivel, null: false, default: true
#t.boolean :troco_ativo, null: false, default: true
class PlanoPagamento < ApplicationRecord
  #Relacionamentos
  belongs_to :empresa
  #Validacoes
  validates :descricao, presence: true, length: {maximum: 255}
  validates :disponivel, :troco_ativo, inclusion: {in: [true, false]}
  #CallBacks
  #Escopes
  #Metodo de Classe
end
