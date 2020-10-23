#encoding utf-8
#t.string :razao, null: false
#t.string :cnpj_cpf, null: false
#t.string :endereco, null: false
#t.string :cidade, null: false
#t.references :empresa_seguimento, foreign_key: true
#t.string :sobre
#t.string :cor_layout
#t.string :fb_url
#t.string :insta_url
#t.string :pint_url
#t.string :web_site
#t.string :telefone, null: false
#t.string :celular, null: false
#t.string :email, null: false
#t.string :loja, null: false
#t.string :logomarca
#t.references :plano, foreign_key: true
class Empresa < ApplicationRecord
  #Relacionamento
  belongs_to :empresa_seguimento
  belongs_to :plano
  has_many :empresa_usuarios
  has_many :produto_categoriums
  has_many :plano_pagamentos
  has_many :produtos
  #Validacoes
  validates :razao, :endereco, :cidade, :email, :loja, presence: true, length: {maximum: 255}
  validates :cor_layout, :fb_url, :pint_url, :insta_url, :web_site, length: {maximum: 255}
  has_attached_file :logomarca, :path => "public/empresas/:id-:style-:filename", :url => "/empresas/:id-:style-:filename", :styles => { :original => "600x750>"}
  validates_attachment_content_type :logomarca, content_type: /\Aimage\/.*\z/
  validates :celular, presence: true
  #CallBacks
  #Escopes
  #Metodo de Classe
end
