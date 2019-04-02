class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def search
    result = []
    if params[:keyword].blank?
      redirect_to root_path
    else
      split_keyword = params[:keyword].split(/[[:blank:]]+/)
      split_keyword.each_with_index do |keyword, index|
        if index == 0
          result[index] = Item.where("name LIKE(?) OR description LIKE(?)", "%#{keyword}%","%#{keyword}%")
        else
          result[index] = result[index-1].where("name LIKE(?) OR description LIKE(?)", "%#{keyword}%","%#{keyword}%")
        end
      end
        if result[split_keyword.length-1] != []
          @items = result[split_keyword.length-1].page(params[:page]).per(48)
        else
          @items = Item.limit(24).order("id DESC").page(params[:page]).per(48)
          @error = "該当する商品が見当たりません。商品は毎日増えていますので、これからの出品に期待してください。"
        end
    end
  end
end
