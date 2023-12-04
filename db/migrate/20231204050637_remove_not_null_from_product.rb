class RemoveNotNullFromProduct < ActiveRecord::Migration[7.1]
  def change
    change_column :deposit_products, :prefix, :string, null: true
    change_column :deposit_products, :suffix, :string, null: true
  end
end
