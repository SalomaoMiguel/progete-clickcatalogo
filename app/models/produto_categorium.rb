#econding utf-8
#t.references :empresa, foreign_key: true, null: false
#t.string :descricao, null: false
#t.boolean :disponivel, null: false, default: true
class ProdutoCategorium < ApplicationRecord
 #Relacionamentos
  belongs_to :empresa
  has_many :produtos
 #Validacoes
 validates :descricao, :empresa_id, presence: true, length: {maximum: 255}
 validates :disponivel, inclusion: {in: [true, false]}
 #CallBacks
 #Escopes
 #Metodo de Classe


end
