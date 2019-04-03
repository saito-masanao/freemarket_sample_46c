class LowerCategoriesController < ApplicationController
  def show
    @category = LowerCategory.find(params[:id])
    @items = Item.where(category_id: params[:id]).order(id: "DESC")
  end
end
