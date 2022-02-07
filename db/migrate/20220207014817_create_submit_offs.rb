class CreateSubmitOffs < ActiveRecord::Migration[5.2]
  def change
    create_table :submit_offs do |t|
      t.integer :user_id
      t.string :year_month
      t.string :remarks
      t.date :submited_date
      t.timestamps
    end
  end
end
