class CreateMnVdc < ActiveRecord::Migration[7.1]
  def change
    create_table :mn_vdcs do |t|
      t.references :district, foreign_key: { to_table: :districts }, null: false
      t.string :municipality_name, null: false
      t.string :municipality_type, null: false
      t.timestamps
    end
  end
end
