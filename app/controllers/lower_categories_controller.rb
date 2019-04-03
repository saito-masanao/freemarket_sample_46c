class LowerCategoriesController < ApplicationController
  def show
    @category = LowerCategory.find(params[:id])
    @items = @category.items.page(params[:page]).per(20)
    @items = Item.where(category_id: params[:id]).order(id: "DESC")
  end
end
