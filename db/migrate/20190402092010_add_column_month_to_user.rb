class AddColumnMonthToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :month, :integer
  end
end
