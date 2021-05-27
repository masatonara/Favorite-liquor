class User::HomesController < ApplicationController
  def top
    @user = current_user
    @liquors = Liquor.all.order(:id)
  end

  def about
  end
end
