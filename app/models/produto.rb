#encoding utf-8
#t.references :empresa, foreign_key: true, null: false
#t.references :produto_categoria, foreign_key: true, null: false
#t.string :descricao, null: false
#t.text :especificacao
#t.decimal :preco, null: false, default: 0
#t.boolean :promocao, null: false, default: false
#t.boolean :disponivel, null: false, default: true
#t.boolean :deletado, null: false, default: false
class Produto < ApplicationRecord
  #Relacionamentos
  belongs_to :empresa
  belongs_to :produto_categorium
  #Validacoes
  validates :descricao, presence: true, length: {maximum: 255}
  validates :preco, presence: true
  validates :disponivel, :promocao, :deletado, inclusion: {in: [true, false]}
  has_attached_file :img, :path => "public/produtos/:id-:style-:filename", :url => "/produtos/:id-:style-:filename", :styles => { :original => "600x750>"}
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
  #CallBacks
  #Escopes
  #Metodo de Classe
end
