class OrdersController < ApplicationController

  #商品購入確認画面表示
  def new
    @item = Item.find(params[:item_id])
    @user = get_user_info()
    render '/users/itemconfirm'
  end

  #商品購入処理
  def create
    _success_flag = true
    _param = get_order_param()

    begin
      ActiveRecord::Base.transaction do
        #アイテムステータスの更新
        _item = Item.find(_param[:item_id])
        _item.update(item_status: get_item_status())
        #オーダーテーブルの生成
        _order = Order.new(_param)
        _order.save
      end
    rescue => e
      _success_flag = false
    end

    @MESSAGE = (_success_flag) ? "成功": "失敗"
  end

  private

  def get_order_param()
    return {
      user_id: params[:user_id].to_i,
      item_id: params[:item_id].to_i,
    }
  end

  # [@ToDo] itemテーブルのitem_statusカラムを商品購入状態に変更する仮の値を取得する。
  def get_item_status()
    return 1
  end

  # [@ToDo]Userテーブルが完璧出ないため仮のダミーデータを生成している
  def get_user_info()
    _w = current_user.slice(:id, :last_name, :first_name, :nickname)
    _ret = {}

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
