class CreditCardController < ApplicationController
  # before_action :get_token, only: [:create]

  # 支払い方法確認画面
  def index
    # binding.pry #[@kari]
    _credit_record = Credit.find_by(get_user_id())
    if _credit_record
      @card_info = Credit.get_CardInfo(_credit_record)
    else
      @card_info = nil
    end
    # binding.pry
  end

  # 支払い方法入力画面
  def new
    # binding.pry #[@kari]
    @credit = Credit.new
    render 'users/creditregistration'
  end

  # カード情報登録処理
  def create
    # binding.pry #[@kari]

    _record = Credit.create_CreditRecord(params.require(:card_token))
    credit_record = Credit.new(_record)
    credit_record.save
    render 'index'
  end

  # カード情報削除画面
  def destroy
    _credit_record = Credit.find_by(get_user_id())
    Credit.destroy_CardInfo(_credit_record)
    _credit_record.destroy

    binding.pry #[@kari]
  end

  # [@ToDo]今のところ使う予定なし
  def edit
  end
  def show
  end
  def update
  end

  private
  def get_user_id
    return {user_id:1} #[@kari]最終的にはログインユーザーIDを取得する
  end

end
