class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.string :class_icon, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
