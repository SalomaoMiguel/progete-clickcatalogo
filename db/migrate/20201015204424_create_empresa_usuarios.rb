class CreateEmpresaUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :empresa_usuarios do |t|
      t.references :empresa, foreign_key: true
      t.string :nome, null: false
      t.string :email, null: false
      t.boolean :email_validado, null: false, default: false
      t.string :senha, null: false
      t.string :telefone, null: false

      t.timestamps
    end
  end
end
