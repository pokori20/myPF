class CreatePatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :patterns do |t|
      t.string :alphabet
      t.float :hours
      t.string :shift_pattern
      t.timestamps
    end
  end
end
