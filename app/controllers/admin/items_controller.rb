class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "変更を保存しました。"
      redirect_to admin_items_path
    else
      flash[:danger] = "保存に失敗しました。"
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :genre_id, :is_active, :name, :introduction, :price)
  end
end
