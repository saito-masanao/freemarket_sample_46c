class AddNameToMiddleCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :middle_categories, :name, :string
    add_column :middle_categories, :category_id, :integer
  end
end
