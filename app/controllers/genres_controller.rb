class GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path, notice: "カテゴリーを追加しました。"
    else
      render :new, alert: "カテゴリーの追加に失敗しました。"
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path, notice: "変更が保存されました。"
    else
      render :edit, alert: "変更が保存できませんでした。"
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genres_path, notice: "カテゴリーを削除しました。"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
