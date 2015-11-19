class AddTempIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :temp_id, :integer
    add_column :users, :name, :string
  end
end
