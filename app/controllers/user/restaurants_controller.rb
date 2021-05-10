class User::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def show
    @liquor = Liquor.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(book_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to rastaurant_path(@restaurant), notice: "投稿されました"
    else
      @restaurants = Restaurant.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: "変更されました"
    else
      render "edit"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to liquors_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :image, :introduction, :restaurant_address, :phone)
  end

  def ensure_correct_user
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.user == current_user
      redirect_to restaurant_path
    end
  end

end

