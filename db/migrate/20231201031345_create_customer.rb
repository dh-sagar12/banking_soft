class CreateCustomer < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.integer :profile_id, null: false
      t.date :introduced_date, null: false
      t.references :branch, foreign_key: { to_table: :branches }, null: false
      t.boolean :status, default: true, null: false
      t.date :termination_date
      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
