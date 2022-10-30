class Admin::GenresController < ApplicationController

  def create
    genre = Genre.new(genre_params)
   genre.save

   redirect_to edit_admin_genre_path(genre.id)
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end