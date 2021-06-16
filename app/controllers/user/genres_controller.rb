class User::GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genres = Genre.all
  end
  
  def show
    @genre = Genre.find(params[:id])
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:genre_name, :is_valid)
  end

end

