class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  @items = Item.all.order("created_at DESC")
  end


  def new
  @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end


private
def item_params
  params.require(:item).permit(:image, :item_name, :item_info, :category_id, :sale_status_id, :shipping_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
end


end