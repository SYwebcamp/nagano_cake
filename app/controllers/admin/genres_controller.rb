class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genres_params)
    if @genre.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_genre_path(@genre)
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genres_params)
      flash[:succsess] = "変更を保存しました"
      redirect_to admin_genres_path
    else
      flash[:danger] = "変更に失敗しました"
      render :edit
    end
  end

  private
  def genres_params
    params.require(:genre).permit(:name,)
  end
end
