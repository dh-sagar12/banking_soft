class AlterTableKycAddressAddForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :kyc_addresses, :districts, column: :district, primary_key: :id
    add_foreign_key :kyc_addresses, :provinces, column: :province, primary_key: :id
    add_foreign_key :kyc_addresses, :mn_vdcs, column: :mn_vdc, primary_key: :id
  end
end
