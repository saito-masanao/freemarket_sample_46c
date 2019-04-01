class ItemsController < ApplicationController

  def index
    @ladies = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @mens = Item.where(category_id: 2).order("created_at DESC").limit(4)
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
        @errors = @item_form.errors
        render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    other_items = Item.where.not(id: params[:id])

    near_items = other_items.where(category_id: @item.category.id)
    @prev_item = near_items[rand(near_items.length)]
    more_near_items = near_items.where.not(id: @prev_item.id)
    @next_item = more_near_items[rand(more_near_items.length)]

    @comment = Comment.new
    @comments = @item.comments

    @user_items = other_items.where(user_id: @item.user.id).limit(6)
    @category_items = other_items.where(category_id: @item.category.id).limit(6)
  end

  def destroy
    Item.find(params[:id]).destroy
    render :index
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
