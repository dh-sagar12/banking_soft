class AlterDepositProductAddReference < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :deposit_products, :frequencies, column: :interest_posting_frequency_id, primary_key: :id
    add_foreign_key :deposit_products, :deposit_int_calc_types, column: :interest_calculation_type_id, primary_key: :id
  end
end
