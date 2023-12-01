class AlterUserAddFieldBranchId < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :branch, foreign_key: { to_table: :branches }

    update("UPDATE users SET branch_id = (SELECT id FROM branches WHERE is_head_office ) WHERE branch_id IS NULL")
    change_column :users, :branch_id, :bigint, null: false
  end
end
