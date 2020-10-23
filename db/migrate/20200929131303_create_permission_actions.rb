class CreatePermissionActions < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_actions do |t|
      t.references :permission_controller, foreign_key: true
      t.string :action_name, null: false
      t.boolean :action_controlled, null: false, default: true
      t.boolean :action_link, null: false, default: false

      t.timestamps
    end
  end
end
