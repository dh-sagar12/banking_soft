class AddColumnLastUpdateByDepositAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :deposit_accounts, :last_update_by, :integer, null: false

    add_foreign_key :deposit_accounts, :users, column: :last_update_by, primary_key: :id
  end
end
