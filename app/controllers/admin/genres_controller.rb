class Admin::GenresController < ApplicationController
  before_action :check_genre_existence, only: [:edit, :update]

  def create
    @genre = Genre.new(genre_params)
      if @genre.save
        flash[:notice] = "ジャンルを登録しました。"
        redirect_to admin_genres_path
      else
        @genres = Genre.all
        render :index
      end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを更新しました。"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end


  def check_genre_existence
    @genre=Genre.find_by(id: params[:id])
    unless @genre
      redirect_to admin_genres_path
    end
  end



end
