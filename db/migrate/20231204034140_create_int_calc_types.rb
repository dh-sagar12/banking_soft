class CreateIntCalcTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :deposit_int_calc_types do |t|
      t.string :type_name, null: false
      t.references :frequency, foreign_key: { to_table: :frequencies }, null: false
      t.boolean :status, default: true
    end
  end
end
