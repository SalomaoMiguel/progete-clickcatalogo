class CreatePlanos < ActiveRecord::Migration[5.2]
  def change
    create_table :planos do |t|
      t.references :plataforma, foreign_key: true
      t.string :descricao, null: false
      t.decimal :valor, null: false
      t.integer :qtd_produto, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
