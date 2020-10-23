class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.references :country, foreign_key: true
      t.string :code, null: false
      t.string :name, null: false
      t.string :acronym, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
