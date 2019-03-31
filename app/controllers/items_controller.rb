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
        redirect_to 'new'
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

  def search
    if params[:item].blank?
      redirect_to root_path
    else
      split_keyword = params[:keyword].split(/[[:blank:]]+/) #空白で分割
      @items = []
      split_keyword.each do |keyword| #分割したキーワード毎に検索
        next if keyword == "" #先頭に空白があってもその後のキーワードで検索
        @items = Item.where("name LIKE(?) OR description LIKE(?)", "%#{keyword}%","%#{keyword}%").page(params[:page]).per(48)
        @all_items = Item.order("id DESC")
      end
    end
  end
end
