class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :logged_in?, only: [:edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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
  def show
  end
  def edit
  end
  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:item_name, :price, :description, :image, :distination_id, :status_id, :category_id, :shipping_day_id, :shipping_cost_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def logged_in?
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
