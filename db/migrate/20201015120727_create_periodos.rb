class CreatePeriodos < ActiveRecord::Migration[5.2]
  def change
    create_table :periodos do |t|
      t.date :periodo, null: false
      t.date :dt_ini, null: false
      t.date :dt_fin, null: false
      t.references :plataforma, foreign_key: true

      t.timestamps
    end
  end
end
