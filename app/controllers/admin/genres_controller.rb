class Admin::GenresController < Admin::BaseController

 def create
   @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      redirect_to new_admin_genre_path
    end
 end

  private
   def genre_params
      params.require(:genre).permit(:name)
    end
end
