class Admin::GenresController < ApplicationController

  def create
    genre = Genre.new(genre_params)
   genre.save

   redirect_to edit_genre_path(genre.id)
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
end