#encoding utf-8
#t.string :periodo, null: false
#t.date :dt_ini, null: false
#t.date :dt_fin, null: false
#t.references :plataforma, foreign_key: true
class Periodo < ApplicationRecord
  #References
  belongs_to :plataforma
  #Validacoes
  validates :periodo, presence: true, length: {maximum: 255}
  validates :dt_ini, :dt_fin, presence: true
  #CallBacks
  #Escopes
  #Metodo de Classe
end
