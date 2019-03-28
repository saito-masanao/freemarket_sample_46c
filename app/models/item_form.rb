class ItemForm
    include ActiveModel::Model

  attr_accessor       :name,
                      :description,
                      :category_id,
                      :brand_id,
                      :status,
                      :delivery_fee,
                      :delivery_method,
                      :prefecture_id,
                      :delivery_date,
                      :price,
                      :image,
                      :user_id

  def save
    return false if invalid?
    item = Item.new(name: name,description: description,category_id: category_id,brand_id: brand_id,status: status,delivery_fee: delivery_fee,delivery_method: delivery_method,prefecture_id: prefecture_id,delivery_date: delivery_date,price: price,user_id:user_id)
    image.each do |i|
      item.images.new(image: i)
      item.save
    end
  end


end
