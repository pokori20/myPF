class AddColumnRoleToPublics < ActiveRecord::Migration[5.2]
  def change
    add_column :publics, :role, :integer, null: false, default: 1
  end
end
