class CreatePermissionControllers < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_controllers do |t|
      t.string :controller_name, null: false

      t.timestamps
    end
  end
end
