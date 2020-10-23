#encoding ut-8
#t.string :name, null: false
#t.string :class_icon, null: false
#t.boolean :active, null: false, default: true
class Menu < ApplicationRecord
  #Relacionametos
  has_many :sub_menus
  #Validacoes
  validates :name, :class_icon, presence: true, length: {maximum: 255}
  validates :active, inclusion: {in: [true,false]}
  #CallBack
  #Escopes
end
