#encoding utf-8
#t.references :empresa, foreign_key: true
#t.string :nome, null: false
#t.string :email, null: false
#t.boolean :email_validado, null: false
#t.string :senha, null: false
#t.string :telefone, null: false
class EmpresaUsuario < ApplicationRecord
  #Relacionamento
  belongs_to :empresa
  #Validacoes]
  validates :nome, :email, :senha, presence: true, length: {maximum: 255}
  has_attached_file :avatar, :path => "public/usuarios/:id-:style-:filename", :url => "/usuarios/:id-:style-:filename", :styles => { :original => "600x750>"}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
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
    user = EmpresaUsuario.where(email: login).first
    return false if user.nil?
    return false if sha1(token) != user.senha
    user
  end

  protected
  def self.sha1(token)
    Digest::SHA1.hexdigest(token)
  end
end
