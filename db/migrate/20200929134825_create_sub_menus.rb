class CreateSubMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_menus do |t|
      t.references :menu, foreign_key: true
      t.references :sub_menu, foreign_key: true
      t.references :permission_action, foreign_key: true
      t.string :name, null: false
      t.boolean :ajax, null: false, default: true
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
