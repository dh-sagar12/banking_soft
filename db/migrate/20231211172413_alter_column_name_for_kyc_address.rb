class AlterColumnNameForKycAddress < ActiveRecord::Migration[7.1]
  def change
    rename_column :kyc_addresses, :province, :province_id
    rename_column :kyc_addresses, :district, :district_id
    rename_column :kyc_addresses, :mn_vdc, :mn_vdc_id
  end
end
