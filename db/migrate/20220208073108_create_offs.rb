class CreateOffs < ActiveRecord::Migration[5.2]
  def change
    create_table :offs do |t|
      t.integer :public_id
      t.integer :shop_id
      t.integer :submit_off_id
      t.string :date

      t.timestamps
    end
  end
end
