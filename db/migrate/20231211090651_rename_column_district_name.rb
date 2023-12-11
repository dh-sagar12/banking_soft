class RenameColumnDistrictName < ActiveRecord::Migration[7.1]
  def change
    rename_column :districts, :distring_name, :district_name
  end
end
