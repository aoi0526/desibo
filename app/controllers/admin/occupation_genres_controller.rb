class Admin::OccupationGenresController < ApplicationController
  def index
    @occupation_genre = OccupationGenre.new
    @occupation_genre.destroy
    @occupation_genres = OccupationGenre.all.page(params[:page]).per(10)
  end

  def create
    @occupation_genre = OccupationGenre.new(occupation_genre_params)
    if @occupation_genre.save
      redirect_to admin_occupation_genres_path
    else
      @occupation_genres = OccupationGenre.all
      render :index
    end
  end

  def destroy
    @occupation_genre = OccupationGenre.find(params[:id])
    if @occupation_genre.destroy
      redirect_to admin_occupation_genres_path
    else
      render :index
    end
  end

  private

  def occupation_genre_params
    params.require(:occupation_genre).permit(:name)
  end
end
