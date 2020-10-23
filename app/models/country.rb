#enconding utf-8
#t.string :name, null: false
#t.string :acronym, null: false
#t.boolean :active, null: false, default: true
#t.string :code, null: false
class Country < ApplicationRecord
  #Relacionamentos
  has_many :states
  #Validacoes
  validates :name, presence: true, length: {maximum: 255}
  validates :acronym, presence: true, length: {minimum: 2, maximum: 3}
  validates :code, presence: true, length: {maximum: 255}
  validates :active, presence: true, inclusion: {in: [true, false]}
  #CallBacks
  #Escopes
  #Metodos de Classe
end
