#encoding utf-8
#t.references :bairro, foreign_key: true
#t.integer :cep, null: false
#t.integer :ref, null: false
#t.string :tipo, null: false
#t.string :logradouro, null: false
#t.decimal :latitude, null: false, default: 0
#t.decimal :longitude, null: false, default: 0
#t.boolean :active, null: false, default: true
class Cep < ApplicationRecord
  #Relacionamentos
  belongs_to :bairro
  #Validacoes
  validates :tipo, length: {maximum: 255}
  #validates :latitude, :longitude, presence: true, numericality: true
  validates :ref, :cep, presence: true
  validates :ativo, inclusion: {in: [true, false]}
  #Escopes
  #CallBacks
  #Metodos de Classe
end
