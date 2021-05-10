class User::LiquorsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def show
    @liquor = Liquor.find(params[:id])
    @comment = Comment.new
  end

  def index
    @liquors = Liquor.all
  end

  def new
    @liquor = Liquor.new
  end

  def create
    @liquor = Liquor.new(book_params)
    @liquor.user_id = current_user.id
    if @liquor.save
      redirect_to liquor_path(@liquor), notice: "投稿されました"
    else
      @liquors = Liquor.all
      render 'index'
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
    params.require(:liquor).permit(:name, :image, :introduction, :genre, :restaurant_name, :restaurant_address, :day, :rating)
  end

  def ensure_correct_user
    @liquor = Liquor.find(params[:id])
    unless @liquor.user == current_user
      redirect_to liquors_path
    end
  end

end
