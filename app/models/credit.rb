class Credit < ApplicationRecord
  belongs_to :user

  def self.create_CreditRecord(_token)
    #APIキーの設定
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    # トークン情報を元に顧客を作成
    _customer = Payjp::Customer.create(description: 'test')

    #顧客のカードを作成
    _customer_obj = Payjp::Customer.retrieve(_customer[:id])
    _customer_card = _customer_obj.cards.create(card: _token)

    # 作成した顧客カードからレコード生成
    return {
      user_id: 1,
      customer_id: _customer[:id]
    }
  end

  def self.get_CardInfo(credit_record)
    _customer_id = credit_record.customer_id

    #APIキーの設定
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']

    #顧客情報の取得
    _customer = Payjp::Customer.retrieve(_customer_id)

    #顧客のカード情報取得
    _card_info = _customer.cards.retrieve(_customer[:default_card])

    #戻り値の生成
    return {
      brand:     _card_info.brand.downcase.to_sym,
      exp_month: _card_info.exp_month,
      exp_year:  _card_info.exp_year%100, # 2019から19を取り出すため
      last4:     _card_info.last4,
    }
  end

end
