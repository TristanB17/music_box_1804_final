class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @highest = @genre.highest_rated_song
    @lowest = @genre.lowest_rated_song
  end
end
