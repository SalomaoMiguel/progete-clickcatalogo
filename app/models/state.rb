#encoding utf-8
# t.references :country, foreign_key: true
#t.string :code, null: false
#t.string :name, null: false
#t.string :acronym, null: false
#t.boolean :active, null: false, default: true
class State < ApplicationRecord
  #Relacionamnetos
  belongs_to :country
  has_many :cities
  #Validates
  validates :name, presence: true, length: {maximum: 255}
  validates :code, presence: true, length: {maximum: 255}
  validates :acronym, presence: true, length: {minimum: 2, maximum: 3}
  validates :active, presence: true, inclusion: {in: [true, false]}
  #CallBacks
  #Escopes
  #Metodo de Classe
end
