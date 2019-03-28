class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def show
    @item = Item.find(item_params[:id])

    near_items = Item.where(category_id: @item.category.id).reject{|i| i[:id] == item_params[:id]}
    @prev_item = near_items[rand(near_items.length)]
    more_near_items = near_items.reject{|i| i[:id] == @prev_item[:id] }
    @next_item = more_near_items[rand(more_near_items.length)]

    @comment = Comment.new
    @comments = @item.comments

    max_i = Item.where(user_id: @item.user.id).length
    if max_i < 7
      @user_items = Item.where(user_id: @item.user.id)
    else
      @user_items = Item.where(user_id: @item.user.id)[max_i-6,max_i]
    end

    max_c = Item.where(category_id: @item.category.id).length
    if max_c < 7
      @category_items = Item.where(category_id: @item.category.id)
    else
      @category_items = Item.where(category_id: @item.category.id)[max_c-6,max_c]
    end
  end

  private
  def item_params
    params.permit(:id)
  end
end
