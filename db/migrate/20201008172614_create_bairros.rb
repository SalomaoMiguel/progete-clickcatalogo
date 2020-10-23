class CreateBairros < ActiveRecord::Migration[5.2]
  def change
    create_table :bairros do |t|
      t.references :city, foreign_key: true
      t.integer :ref, null: false
      t.string :descricao
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
