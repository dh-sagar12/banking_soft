class CreateBranchTable < ActiveRecord::Migration[7.1]
  def change
    create_table :branches do |t|
      t.string :branch_name, null: false
      t.string :branch_code, null: false
      t.string :nickname, null: false
      t.references :creator, foreign_key: { to_table: :users }, null: false
      t.integer :ibt_gl, null: false
      t.timestamps
    end
  end
end
