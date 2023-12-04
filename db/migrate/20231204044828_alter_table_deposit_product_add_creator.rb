class AlterTableDepositProductAddCreator < ActiveRecord::Migration[7.1]
  def change
    add_column :deposit_products, :creator_id, :integer
    add_foreign_key :deposit_products, :users, column: :creator_id, primary_key: :id
  end
end
