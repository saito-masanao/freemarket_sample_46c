class ItemsController < ApplicationController
  def new
  end

  def create
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
