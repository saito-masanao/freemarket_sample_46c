class OrdersController < ApplicationController

  #商品購入確認画面表示
  def new
    @item = Item.find(params[:item_id])
    @user = get_user_info()
    render '/users/itemconfirm'
  end

  #商品購入処理
  def create
  end

  private

  def get_user_info()
    _w = current_user.slice(:id, :last_name, :first_name, :nickname)
    _ret = {}

    # [@ToDo]Userテーブルが完璧出ないため仮のダミーデータを生成している
    if _w[:last_name] && _w[:first_name]
      _ret[:name] = "#{_w[:last_name]} #{_w[:first_name]}"
    elsif _w[:nickname]
      _ret[:name] = _w[:nickname]
    else
      _ret[:name] = "真子就有"
    end
    _ret[:id]             = _w[:id]
    _ret[:postal_code]    = "150−0041"
    _ret[:street_address] = "東京都渋谷区神南1丁目12−16アジアビル8F"

    return _ret
  end
end
