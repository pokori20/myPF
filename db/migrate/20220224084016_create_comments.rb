class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :public_id
      t.string :remarks
      t.string :year_month
      t.timestamps
    end
  end
end
