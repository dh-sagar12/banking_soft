class AlterBranchesAddHeadOffice < ActiveRecord::Migration[7.1]
  def change
    add_column :branches, :is_head_office, :boolean, null: false, default: false
  end
end
