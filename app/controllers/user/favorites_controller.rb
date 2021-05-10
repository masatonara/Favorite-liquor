class User::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @liquor = Liquor.find(params[:book_id])
    favorite = @liquor.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @liquor = Liquor.find(params[:liquor_id])
    favorite = @liquor.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
  
end
