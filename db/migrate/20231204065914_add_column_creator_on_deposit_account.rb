class AddColumnCreatorOnDepositAccount < ActiveRecord::Migration[7.1]
  def change
    add_column :deposit_accounts, :creator_id, :integer, null: false

    add_foreign_key :deposit_accounts, :users, column: :creator_id, primary_key: :id
  end
end
