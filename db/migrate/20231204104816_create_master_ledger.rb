class CreateMasterLedger < ActiveRecord::Migration[7.1]
  def change
    create_table :master_ledgers do |t|
      t.string :master_code, null: false
      t.string :account_name, null: false
      t.string :account_name_np, null: false
      t.string :account_type, null: false
      t.timestamps
    end
    add_index :master_ledgers, :master_code, unique: true
    add_index :master_ledgers, :account_name, unique: true
    add_index :master_ledgers, :account_name_np, unique: true
  end
end
