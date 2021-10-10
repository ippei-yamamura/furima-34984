class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :price, :description, :image, :distination_id, :status_id, :category_id, :shipping_day_id, :shipping_cost_id).merge(user_id: current_user.id)
  end
end
