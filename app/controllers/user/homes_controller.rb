class User::HomesController < ApplicationController
  def top
    @user = current_user
    @liquors = Liquor.order(:id)
  end

  def about
  end
end
