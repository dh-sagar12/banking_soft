class CreateDepositProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :deposit_products do |t|
      t.references :branch, foreign_key: { to_table: :branches }, null: false
      t.string :product_name, null: false
      t.string :product_name_np, null: false
      t.string :prefix, null: false
      t.string :suffix, null: false
      t.integer :acc_digit, null: false
      t.string :product_type, null: false
      t.integer :duration
      t.numeric :minimum_balance
      t.numeric :interest_rate, null: false
      t.integer :interest_posting_frequency_id, null: false #foreign_key
      t.integer :interest_calculation_type_id, null: false #foreign_key
      t.integer :tran_gl_id, null: false #foreign_key
      t.integer :interest_expenses_gl_id, null: false #fk
      t.integer :interest_payable_gl_id, null: false #fk
      t.integer :tax_gl_id, null: false #fk
      t.numeric :tax_rate, null: false, default: 6
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
