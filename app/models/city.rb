#encoding utf-8
# t.references :state, foreign_key: true
#t.string :code, null: false
#t.integer :ref, null: false
#t.string :name, null: false
#t.string :ddd, null: false
#t.decimal :latitude, null: false, default: 0
#t.decimal :longitude, null: false, default: 0
#t.boolean :active, null: false, default: true
class City < ApplicationRecord
  #Relacionamentos
  belongs_to :state
  has_many :bairros
  #Validacoes
  validates :code, :name, presence: true, length: {maximum: 255}
  validates :ref, presence: false
  #validates :ddd, presence: true, length: {minimum: 3, maximum: 3}
  validates :latitude, :longitude, presence: true, numericality: true
  validates :active, presence: true, inclusion: {in: [true, false]}
  #Callbacks
  #Escopes
  #Metodo de Classe
end
