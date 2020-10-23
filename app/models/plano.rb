#encoding utf-8
#t.references :plataforma, foreign_key: true
#t.string :descricao, null: false
#t.decimal :valor, null: false
#t.integer :qtd_produto, null: false
#t.boolean :ativo, null: false, default: true
class Plano < ApplicationRecord
  #Relacionamento
  belongs_to :plataforma
  has_many :empresas
  #Validacoes
  validates :descricao, presence: true, length: {maximum: 255}
  validates :valor, :qtd_produto, presence: true, numericality: true
  validates :ativo,  inclusion: {in: [true, false]}
  #CallBacks
  #Escopes
  #Metodo de Classe
end
