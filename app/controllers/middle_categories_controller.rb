class MiddleCategoriesController < ApplicationController
  def index
    
    
    
  end

  def show
    
    @category = MiddleCategory.find(params[:id])
    @items = Item.where(category_id: params[:id]).order(id: "DESC")
  end
end
