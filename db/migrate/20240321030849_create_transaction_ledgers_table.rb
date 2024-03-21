class CreateTransactionLedgersTable < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_ledgers do |t|
      t.string :account_code, null: false
      t.string :account_name, null: false
      t.string :account_name_np, null: false
      t.boolean :is_active, null: false, default: true
      t.references :branch, foreign_key: { to_table: :branches }, null: true
      t.references :group_ledger, foreign_key: { to_table: :group_ledgers }, null: false
      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
