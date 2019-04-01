class ItemsController < ApplicationController

  def top
    @ladies = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @mens = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @kids = Item.where(category_id: 3).order("created_at DESC").limit(4)
    @cosmetics = Item.where(category_id: 7).order("created_at DESC").limit(4)
    @chanels = Item.where(brand_id: 1).order("created_at DESC").limit(4)
    @vuittons = Item.where(brand_id: 3).order("created_at DESC").limit(4)
    @supremes = Item.where(brand_id: 4).order("created_at DESC").limit(4)
    @nikes = Item.where(brand_id: 2).order("created_at DESC").limit(4)
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_params)
    if @item_form.save
        redirect_to root_path
      else
        errors = @item_form.errors
        @image_error = errors[:images][0] if errors[:images][0]
        @name_error = errors[:name][0] if errors[:name][0]
        @description_error = errors[:description][0]if errors[:description][0]
        @category_error = errors[:category_id][0] if errors[:category_id][0]
        @brand_error = errors[:brand_id][0] if errors[:brand_id][0]
        @status_error = errors[:status][0] if errors[:status][0]
        @delivery_fee_error = errors[:delivery_fee][0] if errors[:delivery_fee][0]
        @delivery_date_error = errors[:delivery_date][0] if errors[:delivery_date][0]
        @delivery_method_error = errors[:delivery_method][0] if errors[:delivery_method][0]
        @prefecture_id_error = errors[:prefecture_id][0] if errors[:prefecture_id][0]
        @price_error = errors[:price][0] if errors[:price][0]
        render :new
    end
  end

  private

  def item_params
    params.require(:item_form).permit(
      :name,
      :description,
      :category_id,
      :brand_id,
      :status,
      :delivery_fee,
      :delivery_method,
      :prefecture_id,
      :delivery_date,
      :price,
       { :images => [] }
      ).merge(user_id:current_user.id)
  end
end
