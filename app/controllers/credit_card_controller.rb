class CreditCardController < ApplicationController
  # before_action :get_token, only: [:create]

  # 支払い方法確認画面
  def index
    # binding.pry #[@kari]
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
    _token = get_token_param()

    #APIキーの設定
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    # トークン情報を元に顧客を作成
    _customer = Payjp::Customer.create(description: 'test')

    #顧客のカードを作成
    _customer_obj = Payjp::Customer.retrieve(_customer[:id])
    _customer_card = _customer_obj.cards.create(card: _token)

    # 作成した顧客をDBへ保存
    new_record = {
      user_id: 1,
      card_id: _customer_card[:id]
    }
    credit_record = Credit.new(new_record)
    credit_record.save
  end

  # カード情報削除画面
  def destroy
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
  def get_token_param
    return params.require(:card_token)
  end

end
