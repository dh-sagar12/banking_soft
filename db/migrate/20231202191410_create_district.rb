class CreateDistrict < ActiveRecord::Migration[7.1]
  def change
    create_table :districts do |t|
      t.string :distring_name, null: false
      t.references :province, foreign_key: { to_table: :provinces }, null: false
      t.string :np_name, null: false
      t.string :copomis_code, null: false
    end
  end
end
