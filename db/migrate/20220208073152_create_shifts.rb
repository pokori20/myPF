class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
       t.integer :shop_id
      t.string :image_id
      t.string :year_month
      t.timestamps
    end
  end
end
