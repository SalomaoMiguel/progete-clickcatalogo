#encoding utf-8
#t.string :descricao, null: false
#t.boolean :ativo, null: false, default: true
class EmpresaSeguimento < ApplicationRecord
  #Relacionamentos
  has_many :empresas
  #Validacoes
    validates :descricao, presence: true, length: {maximum: 255}
    validates :ativo, inclusion: {in: [true, false]}
  #CallBacks
  #Escopes
  #Metodo de Classe
end
