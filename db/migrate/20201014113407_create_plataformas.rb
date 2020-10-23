class CreatePlataformas < ActiveRecord::Migration[5.2]
  def change
    create_table :plataformas do |t|
      t.string :descricao, null: false
      t.string :desenvolvedora, null: false
      t.string :cnpj, null: false

      t.timestamps
    end
  end
end
