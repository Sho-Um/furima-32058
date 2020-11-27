class OrdersController < ApplicationController
  def index
    @user_item_order = UserItemOrder.new
  end

  def create
    @user_item_order = UserItemOrder.new(order_params)
    if @user_item_order.valid?
      @user_item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_item_id).merge(user_id: current_user.id)
  end
end
