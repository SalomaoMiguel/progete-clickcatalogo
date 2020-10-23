class CreateProdutoCategoria < ActiveRecord::Migration[5.2]
  def change
    create_table :produto_categoria do |t|
      t.references :empresa, foreign_key: true, null: false
      t.string :descricao, null: false
      t.boolean :disponivel, null: false, default: true

      t.timestamps
    end
  end
end
