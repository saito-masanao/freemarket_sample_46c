class CreateTableItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,null:false
      t.text :description,null:false
      t.references :category, foreign_key: true,null:false
      t.references :brand, foreign_key: true,null:false
      t.integer :status,null:false
      t.integer :delivery_fee,null:false
      t.integer :delivery_date,null:false
      t.integer :delivery_method,null:false
      t.integer :prefecture_id,null:false
      t.integer :price,null:false
      t.references :user, foreign_key: true,null:false
      t.timestamps
    end
  end
end
