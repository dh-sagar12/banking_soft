class RenameColumnLastUpdateBy < ActiveRecord::Migration[7.1]
  def change
    rename_column :deposit_accounts, :last_update_by, :last_update_by_id
  end
end
