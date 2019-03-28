class AddNameToLowerCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :lower_categories, :name, :string
  end
end
