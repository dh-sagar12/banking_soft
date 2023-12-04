class CreateKycAddress < ActiveRecord::Migration[7.1]
  def change
    create_table :kyc_addresses do |t|
      t.references :kyc_personal, foreign_key: { to_table: :kyc_personals }, null: false
      t.string :address_type, null: false ##enum
      t.integer :province, null: false  #foreign key
      t.integer :district, null: false  # foreign key
      t.integer :mn_vdc, null: false #foreign key
      t.integer :ward_no, null: false
      t.string :street
      t.string :tole_name
      t.timestamps
    end
  end
end
