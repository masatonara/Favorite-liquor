class User::LiquorsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @liquor = Liquor.find(params[:id])
    @comment = Comment.new
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。

    respond_to do |format|
      format.js
    end
  end

  def index
    @liquors = Liquor.all
    @users = User.all.order(:id)
  end

  def new
    @liquor = Liquor.new
  end

  def create
    @liquor = Liquor.new(liquor_params)
    @liquor.user_id = current_user.id
    if @liquor.save
      redirect_to liquor_path(@liquor), success: "投稿されました"
    else
      @liquors = Liquor.all
      render 'new'
    end
  end

  def edit
  end

  def update
    if @liquor.update(liquor_params)
      redirect_to liquor_path(@liquor), notice: "変更されました"
    else
      render "edit"
    end
  end

  def destroy
    @liquor.destroy
    redirect_to liquors_path
  end

  private

  def liquor_params
    params.require(:liquor).permit(:liquor_image, :name, :introduction, :genre_id, :restaurant_name,
                                   :address, :day, :rate, :latitude, :longitude)
  end

  def ensure_correct_user
    @liquor = Liquor.find(params[:id])
    unless @liquor.user == current_user
      redirect_to liquors_path
    end
  end
end
