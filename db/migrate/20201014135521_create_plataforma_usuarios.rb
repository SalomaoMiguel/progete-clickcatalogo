class CreatePlataformaUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :plataforma_usuarios do |t|
      t.string :nome, null: false
      t.string :senha, null: false
      t.references :plataforma, foreign_key: true
      t.string :email, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
