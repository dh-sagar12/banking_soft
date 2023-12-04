class AlterTableNameDepositInterestCalcTypes < ActiveRecord::Migration[7.1]
  def change
    rename_table :deposit_int_calc_types, :deposit_interest_calc_types
  end
end
