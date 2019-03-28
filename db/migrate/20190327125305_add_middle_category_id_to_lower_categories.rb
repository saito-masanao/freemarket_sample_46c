class AddMiddleCategoryIdToLowerCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :lower_categories, :middle_category_id, :integer
  end
end
