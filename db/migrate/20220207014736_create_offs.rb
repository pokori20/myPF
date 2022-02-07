class CreateOffs < ActiveRecord::Migration[5.2]
  def change
    create_table :offs do |t|
      t.integer :user_id
      t.integer :submit_off_id
      t.date :date
      t.timestamps
    end
  end
end
