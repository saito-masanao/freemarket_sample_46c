class ItemForm
    include ActiveModel::Model
  validates :images,presence: {message: "画像がありません"}
  validates :name, presence: {message:"40字以内で入力してください"},length: { maximum: 40 ,message: "40字以内で入力してください"}
  validates :description, presence: {message:"1000字以内で入力してください"},length: { maximum: 1000 ,message: "1000字以上で入力してください"}
  validates :category_id, presence: {message:"入力してください"}
  validates :brand_id, presence: {message:"入力してください"}
  validates :status, presence: {message:"入力してください"}
  validates :delivery_fee, presence: {message:"入力してください"}
  validates :delivery_date, presence: {message:"入力してください"}
  validates :delivery_method, presence: {message:"入力してください"}
  validates :prefecture_id, presence: {message:"入力してください"}
  validates :price, presence: {message:"300以上9999999以下で入力してください"}
  validates :price,numericality: { only_integer: true,greater_than: 299,less_than:10000000 ,message:"300以上9999999以下で入力してください"}

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
                      :remove_images,
                      :user_id,
                      :id

  def initialize(attr = {})
    if attr[:id]
       @item = Item.find(attr[:id])
        self.id = attr[:id].nil? ? @item.name : attr[:id]
        self.name = attr[:name].nil? ? @item.name : attr[:name]
        self.description = attr[:description].nil? ? @item.description : attr[:description]
        self.category_id = attr[:category_id].nil? ? @item.category_id : attr[:category_id]
        self.brand_id = attr[:brand_id].nil? ? @item.brand_id : attr[:brand_id]
        self.status = attr[:status].nil? ? @item.status : attr[:status]
        self.delivery_fee = attr[:delivery_fee].nil? ? @item.delivery_fee : attr[:delivery_fee]
        self.delivery_method = attr[:delivery_method].nil? ? @item.delivery_method : attr[:delivery_method]
        self.prefecture_id = attr[:prefecture_id].nil? ? @item.prefecture_id : attr[:prefecture_id]
        self.delivery_date = attr[:delivery_date].nil? ? @item.delivery_date : attr[:delivery_date]
        self.price = attr[:price].nil? ? @item.price : attr[:price]
        self.images = attr[:images].nil? ? nil : attr[:images]
        self.remove_images = attr[:remove_images].nil? ? nil : attr[:remove_images]
        self.user_id = attr[:user_id].nil? ? @item.user_id : attr[:user_id]
     else
        super(attr)
    end
  end

  def save
    return false if invalid?
    item = Item.new(name: name,description: description,category_id: category_id,brand_id: brand_id,status: status,delivery_fee: delivery_fee,delivery_method: delivery_method,prefecture_id: prefecture_id,delivery_date: delivery_date,price: price,user_id:user_id)
    images.each do |i|
      item.images.new(image: i)
      item.save
    end
  end

  def update
    return false if invalid?
    @item = Item.find(id)
    @item.update(name: name,description: description,category_id: category_id,brand_id: brand_id,status: status,delivery_fee: delivery_fee,delivery_method: delivery_method,prefecture_id: prefecture_id,delivery_date: delivery_date,price: price,user_id:user_id)
    if remove_images
      remove_images.each do |r|
        @item.images.find(r).destroy
      end
    end
    if images
      images.each do |i|
        @item.images.new(image: i)
        @item.save
      end
    end
  end



end
