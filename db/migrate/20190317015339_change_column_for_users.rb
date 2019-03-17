class ChangeColumnForUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname,:string,null:false
    remove_column :users, :birth_day, :integer,null:false
  end
