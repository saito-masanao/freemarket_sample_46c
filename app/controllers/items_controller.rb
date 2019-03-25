class ItemsController < ApplicationController

  def top
    @nikes = Item.where(brand_id: 2).order("created_at DESC").limit(4)
    @supremes =Item.where(brand_id: 4).order("created_at DESC").limit(4)
  end

  def new
  end

  def create
  end
end
