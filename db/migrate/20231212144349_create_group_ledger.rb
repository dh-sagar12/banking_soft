class CreateGroupLedger < ActiveRecord::Migration[7.1]
  def change
    create_table :group_ledgers do |t|
      t.string :account_code, null: false
      t.string :account_name, null: false
      t.string :account_name_np, null: false
      t.boolean :is_active, null: false, default: true
      t.references :master_ledger, foreign_key: { to_table: :master_ledgers }, null: false
      t.timestamps
    end
  end
end
