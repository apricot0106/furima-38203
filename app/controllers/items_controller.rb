class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]# [, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :ship_from_id, :preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if current_user != @item.user
      redirect_to root_path
    end
  end
end