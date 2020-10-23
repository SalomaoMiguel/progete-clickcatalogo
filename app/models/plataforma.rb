#encoding utf-8
#t.string :descricao, null: false
#t.string :desenvolvedora, null: false
#t.string :cnpj, null: false
class Plataforma < ApplicationRecord
  #Relacionamentos
  has_many :plataforma_usuarios
  has_many :planos
  has_many :periodos
  #Validacoes
  validate do
    if self.new_record?
    errors.add(:base, 'Não pode ser maior que um registro') if ((Plataforma.count + 1) > 1)
      end
  end
  validates :descricao, :cnpj, :desenvolvedora, presence:true, length: {maximum: 255}
  #CallBacks
  #Escopes
  #Metodo de Classe
end
