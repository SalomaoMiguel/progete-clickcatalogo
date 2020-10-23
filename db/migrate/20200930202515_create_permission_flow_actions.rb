class CreatePermissionFlowActions < ActiveRecord::Migration[5.2]
  def change
    create_table :permission_flow_actions do |t|
      t.references :permission_flow, foreign_key: true
      t.references :permission_action, foreign_key: true

      t.timestamps
    end
  end
end
