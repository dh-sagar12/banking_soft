class CreateKycPersonal < ActiveRecord::Migration[7.1]
  def change
    create_table :kyc_personals do |t|
      t.references :customer, foreign_key: { to_table: :customers }, null: false
      t.boolean :is_minor, null: false, default: false
      t.boolean :is_residential, null: false, default: true
      t.string :salutation, null: false ##enum
      t.string :first_name, null: false
      t.string :middle_name, null: true
      t.string :last_name, null: false
      t.string :gender, null: false ##enum
      t.date :date_of_birth, null: false
      t.string :email
      t.string :maritial_status, null: false ##enum
      t.string :pan_number
      t.string :nea_customer_id
      t.string :khanepani_customer_id
      t.string :voting_address
      t.string :qualification
      t.timestamps
    end
  end
end
