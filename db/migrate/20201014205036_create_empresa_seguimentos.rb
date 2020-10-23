class CreateEmpresaSeguimentos < ActiveRecord::Migration[5.2]
  def change
    create_table :empresa_seguimentos do |t|
      t.string :descricao, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
