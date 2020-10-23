class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.references :state, foreign_key: true
      t.string :code, null: false
      t.integer :ref, null: false
      t.string :name, null: false
      t.string :ddd, null: false
      t.decimal :latitude
      t.decimal :area
      t.decimal :longitude
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
