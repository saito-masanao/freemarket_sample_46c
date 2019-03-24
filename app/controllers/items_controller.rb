class ItemsController < ApplicationController

  def top
    @items = Item.all.order("created_at DESC").limit(4)
    @nikes = Item.where(brands: 2).order("created_at DESC").limit(4)
  end

  def new
  end

  def create
  end
end
