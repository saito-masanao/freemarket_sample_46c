class ItemForm
    include ActiveModel::Model

  validates :name, presence: true,length: { maximum: 40 }
  validates :description, presence: true,length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :brand_id, presence: true
  validates :status, presence: true
  validates :delivery_fee, presence: true
  validates :delivery_date, presence: true
  validates :delivery_method, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true


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
                      :images,
                      :user_id

  def save
    return false if invalid?
    item = Item.new(name: name,description: description,category_id: category_id,brand_id: brand_id,status: status,delivery_fee: delivery_fee,delivery_method: delivery_method,prefecture_id: prefecture_id,delivery_date: delivery_date,price: price,user_id:user_id)
    images.each do |i|
      item.images.new(image: i)
      item.save
    end
  end


end
