class CreatePermissionFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_flows do |t|
      t.references :sub_menu, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
