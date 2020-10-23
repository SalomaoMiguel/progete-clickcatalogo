class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :razao, null: false
      t.string :cnpj_cpf, null: false
      t.string :endereco, null: false
      t.string :cidade, null: false
      t.references :empresa_seguimento, foreign_key: true
      t.text :sobre
      t.string :cor_layout
      t.string :fb_url
      t.string :insta_url
      t.string :pint_url
      t.string :web_site
      t.string :telefone
      t.string :celular, null: false
      t.string :email, null: false
      t.string :loja, null: false
      t.string :logomarca
      t.references :plano, foreign_key: true

      t.timestamps
    end
  end
end
