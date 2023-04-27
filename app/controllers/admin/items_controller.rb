class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # def show
  #   @ietm = Item.find(params[:id])
  # end

  def edit
    @item = Item.find(params[:id])
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:danger] = "登録に失敗しました。"
      render :new
    end
  end

  def update

  end

  private
  def item_params
    params.require(:item).permit(:image, :genre_id, :is_active, :name, :introduction, :price)
  end
end
