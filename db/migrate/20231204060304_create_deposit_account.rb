class CreateDepositAccount < ActiveRecord::Migration[7.1]
  def change
    create_table :deposit_accounts do |t|
      t.references :branch, foreign_key: { to_table: :branches }, null: false
      t.date :account_opening_date, null: false
      t.references :customer, foreign_key: { to_table: :customers }, null: false
      t.references :deposit_product, foreign_key: { to_table: :deposit_products }, null: false
      t.integer :account_id, null: false
      t.string :account_number, null: false
      t.integer :introducer_id, null: false #fk to employee
      t.numeric :interest_rate, null: false
      t.integer :account_duration
      t.references :interest_frequency, foreign_key: { to_table: :frequencies }, null: false
      t.references :interest_nominee, foreign_key: { to_table: :deposit_accounts }
      t.references :account_nominee, foreign_key: { to_table: :deposit_accounts }
      t.boolean :status, default: true
      t.date :terminated_on
      t.numeric :minimum_balance, null: false, default: 0
      t.numeric :installment_amount
      t.references :installment_frequency, foreign_key: { to_table: :frequencies }, null: true
      t.references :installment_account, foreign_key: { to_table: :deposit_accounts }
      t.integer :joint_customers, array: true
      t.string :account_name
      t.string :display_address
      t.timestamps
    end

    add_index :deposit_accounts, :account_number, unique: true
  end
end
