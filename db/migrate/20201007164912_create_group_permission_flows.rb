class CreateGroupPermissionFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :group_permission_flows, id: false do |t|
      t.references :group, foreign_key: true
      t.references :permission_flow, foreign_key: true
    end
  end
end
