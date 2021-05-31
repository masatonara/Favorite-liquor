class User::HomesController < ApplicationController
  def top
    @user = current_user
    @liquors = Liquor.order("RAND()").limit(5)
  end

  def about
  end
end
