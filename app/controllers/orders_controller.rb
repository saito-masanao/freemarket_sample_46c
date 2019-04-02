class OrdersController < ApplicationController

  #商品購入確認画面表示
  def new
    render '/users/itemconfirm'
  end

  #商品購入処理
  def create
  end

end
