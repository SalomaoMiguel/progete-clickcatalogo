class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :acronym, null: false
      t.boolean :active, null: false, default: true
      t.string :code, null: false

      t.timestamps
    end
  end
end
