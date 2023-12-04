class CreateProvince < ActiveRecord::Migration[7.1]
  def change
    create_table :provinces do |t|
      t.string :province_name, null: false
      t.string :np_name, null: false
    end
  end
end

# insert into  provinces

# SELECT 2, 	'Province 2', 	'प्रदेश २' UNION ALL
# SELECT 3,	'Province 3', 	'प्रदेश ३' UNION ALL
# SELECT 4,	'Province 4', 	'प्रदेश ४' UNION ALL
# SELECT 5,	'Province 5', 	'प्रदेश ५'UNION ALL
# SELECT 6,	'Province 6', 	'प्रदेश ६'UNION ALL
# SELECT 7,	'Province 7', 	'प्रदेश ७'
