class ItemsController < ApplicationController

  def top
    @ladies = Item.where(category_id: 1).order("created_at DESC").limit(4)
    @nikes = Item.where(brand_id: 2).order("created_at DESC").limit(4)
    @supremes = Item.where(brand_id: 4).order("created_at DESC").limit(4)
    @vuittons = Item.where(brand_id: 3).order("created_at DESC").limit(4)
    @chanels = Item.where(brand_id: 1).order("created_at DESC").limit(4)
  end

  def new
  end

  def create
  end
end
