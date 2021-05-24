class User::FavoritesController < ApplicationController
  before_action :authenticate_user!


  def create
    @liquor = Liquor.find(params[:liquor_id])
    favorite = @liquor.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @liquor = Liquor.find(params[:liquor_id])
    favorite = @liquor.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

end
