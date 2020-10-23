#encoding utf-8
#t.string :nome, null: false
#t.string :senha, null: false
#t.references :plataforma, foreign_key: true
#t.string :email, null: false
#t.boolean :ativo, null: false, default: true
class PlataformaUsuario < ApplicationRecord
  #Relacionamentos
  belongs_to :plataforma
  #Validacoes
  validates :nome, :senha, :email, presence: true, length: {maximum: 255}
  has_attached_file :avatar, :path => "public/plataforma_usuarios/:id-:style-:filename", :url => "/plataforma_usuarios/:id-:style-:filename", :styles => { :original => "600x750>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :ativo, inclusion: {in: [true, false]}
  #CallBacks
  before_save :criptografar_senha
  def criptografar_senha
    if !self.senha.blank? and !self.senha.nil?
      self.senha = self.class.sha1(self.senha)
    end
  end
  #Escopes
  #Metodo de Classe
  def self.autenticar(login, token)
    user = PlataformaUsuario.where(ativo: true, email: login).first
    return false if user.nil?
    return false if sha1(token) != user.senha
    user
  end
  protected
  def self.sha1(token)
    Digest::SHA1.hexdigest(token)
  end
end
