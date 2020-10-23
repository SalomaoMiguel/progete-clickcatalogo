class CreateCeps < ActiveRecord::Migration[5.2]
  def change
    create_table :ceps do |t|
      t.references :bairro, foreign_key: true
      t.integer :cep, null: false
      t.integer :ref, null: false
      t.string :tipo
      t.string :logradouro
      t.decimal :latitude
      t.decimal :longitude
      t.boolean :ativo, default: true

      t.timestamps
    end
  end
end
