class ChangeColumnTypeBirthtoUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :birth_day
    remove_column :users, :birth_month
    rename_column :users, :birth_year, :birthday
  end

  def up
    add_column :users, :birth_day,:date,null:false
    add_column :users, :birth_month,:date,null:false
    rename_column :users, :birthday, :birth_year
  end

end
