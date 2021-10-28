class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchase, only: [:index, :create]
  before_action :logged_in?, only: :index
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else 
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:post_code, :distination_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def logged_in?
    redirect_to root_path if current_user.id == @item.user_id
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def prevent_url
    if @item.purchase != nil
      redirect_to root_path
    end
  end
end
