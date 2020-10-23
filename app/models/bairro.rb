#encoding utf-8
# t.references :city, foreign_key: true
#t.integer :ref, null: false
#t.string :descricao, null: false
#t.decimal :latitude, null: false, default: 0
#t.decimal :longitude, null: false, default: 0
class Bairro < ApplicationRecord
  #Relacionamentos
  belongs_to :city
  has_many :ceps
  #Validacoes
  validates :descricao, length: {maximum: 255}
  validates :ref, presence: true
  #validates :latitude, :longitude, presence: true, numericality: true
  #CallBacks
  #Escopes
  #Metodos de Classe

end
