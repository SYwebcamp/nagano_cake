class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    # @items = Item.all.order(created_at: :desc)
    @items = Item.last(4)
  end
  def about
  end
end
