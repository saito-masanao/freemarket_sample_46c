class CreditCardController < ApplicationController
  # 支払い方法確認画面
  def index
    # binding.pry #[@kari]
    _credit_record = Credit.find_by(get_user_id())
    if _credit_record && _credit_record.card_id
      @card_info = Credit.get_CardInfo(_credit_record)
    else
      @card_info = nil
    end
  end

  # 支払い方法入力画面
  def new
    # binding.pry #[@kari]
    @credit = Credit.new
    render 'users/creditregistration'
  end

  # カード情報登録処理
  def create
    _token = params.require(:card_token)

    @credit_record = Credit.find_by(get_user_id())

    # 初めてのカード登録処理の場合はレコードを作成する
    @credit_record = Credit.new unless @credit_record

    Credit.regist_CardInfo(@credit_record, _token)
    @credit_record.save

    redirect_to credit_card_index_path
  end

  # カード情報削除画面
  def destroy
    _credit_record = Credit.find_by(get_user_id())
    if _credit_record
      Credit.destroy_CardInfo(_credit_record)
      _credit_record.save
    end
    redirect_to credit_card_index_path
  end

  private
  def get_user_id
    return {user_id:1} #[@kari]最終的にはログインユーザーIDを取得する
  end

end
