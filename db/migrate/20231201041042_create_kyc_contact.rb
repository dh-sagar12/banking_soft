class CreateKycContact < ActiveRecord::Migration[7.1]
  def change
    create_table :kyc_contacts do |t|
      t.references :kyc_personal, foreign_key: { to_table: :kyc_personals }, null: false
      t.string :contact_type, null: false ##enum
      t.string :contact_relation, null: false ##enum
      t.string :contact_number, null: false
      t.timestamps
    end
  end
end
