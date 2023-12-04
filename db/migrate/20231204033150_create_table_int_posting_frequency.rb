class CreateTableIntPostingFrequency < ActiveRecord::Migration[7.1]
  def change
    create_table :frequencies do |t|
      t.string :frequency_name, null: false
      t.string :frequency_code, null: false
      t.string :frequency_name_np, null: false
      t.string :schedule_freq_name, null: false
      t.string :schedule_frequency_code, null: false
    end
  end
end
