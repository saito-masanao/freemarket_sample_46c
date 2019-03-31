class ItemsController < ApplicationController

  def top
    @ladies = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @mens = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @kids = Item.where(category_id: 3).order("created_at DESC").limit(4)
    @cosmetics = Item.where(category_id: 7).order("created_at DESC").limit(4)
    @chanels = Item.where(brand_id: 1).order("created_at DESC").limit(4)
    @vuittons = Item.where(brand_id: 3).order("created_at DESC").limit(4)
    @supremes = Item.where(brand_id: 4).order("created_at DESC").limit(4)
    @nikes = Item.where(brand_id: 2).order("created_at DESC").limit(4)
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_params)
    if @item_form.save
        redirect_to root_path
      else
        case @item_form.errors[:name][0]
          when "は40文字以内で入力してください"
            @name_error = "40 文字以下で入力してください"
          when "を入力してください"
            @name_error = "入力してください"
        end

        if @item_form.errors[:description][0]
          @description_error = "選択してください"
        end

        if @item_form.errors[:category_id][0]
          @category_error = "選択してください"
        end

        if @item_form.errors[:brand_id][0]
          @brand_error = "選択してください"
        end

        if @item_form.errors[:status][0]
          @status_error = "選択してください"
        end

        if @item_form.errors[:delivery_fee][0]
          @delivery_fee_error = "選択してください"
        end

        if @item_form.errors[:delivery_date][0]
          @delivery_date_error = "選択してください"
        end

        if @item_form.errors[:delivery_method][0]
          @delivery_method_error = "選択してください"
        end

        if @item_form.errors[:prefecture_id][0]
          @prefecture_id_error = "選択してください"
        end

        if @item_form.errors[:prefecture_id][0]
          @prefecture_id_error = "選択してください"
        end

        render :new
    end
  end

  private

  def item_params
    params.require(:item_form).permit(
      :name,
      :description,
      :category_id,
      :brand_id,
      :status,
      :delivery_fee,
      :delivery_method,
      :prefecture_id,
      :delivery_date,
      :price,
       { :images => [] }
      ).merge(user_id:current_user.id)
  end
end
