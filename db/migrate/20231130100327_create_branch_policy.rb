class CreateBranchPolicy < ActiveRecord::Migration[7.1]
  def change
    create_table :branch_policies do |t|
      t.references :branch, foreign_key: { to_table: :branches }, null: false
      t.references :user, foreign_key: { to_table: :users }, null: false
      t.date :date_access_from, null: false
      t.date :date_access_to, null: false
      t.time :time_access_from, null: false
      t.time :time_access_to, null: false
      t.timestamps
    end
    add_index :branch_policies, [:user_id, :branch_id], unique: true
  end
end
