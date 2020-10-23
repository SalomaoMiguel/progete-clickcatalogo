#encoding utf-8
# t.string :name, null: false
#t.boolean :active, null: false, default: true
class Group < ApplicationRecord
  #Relacionamentos
  #Validacoes
  validates :name, presence: true, length: {maximum: 255}
  validates :active, inclusion: {in: [true,false]}
  #CallBacks
  #Escopes

end
