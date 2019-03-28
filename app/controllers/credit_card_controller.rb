class CreditCardController < ApplicationController

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
  end

  # カード情報削除画面
  def destroy
    # binding.pry #[@kari]
  end

  # [@ToDo]今のところ使う予定なし
  def edit
  end
  def show
  end
  def update
  end


end
