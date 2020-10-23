class CreateProdutos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos do |t|
      t.references :empresa, foreign_key: true, null: false
      t.references :produto_categorium, foreign_key: true, null: false
      t.string :descricao, null: false
      t.text :especificacao
      t.decimal :preco, null: false, default: 0
      t.boolean :promocao, null: false, default: false
      t.boolean :disponivel, null: false, default: true
      t.boolean :deletado, null: false, default: false

      t.timestamps
    end
  end
end
