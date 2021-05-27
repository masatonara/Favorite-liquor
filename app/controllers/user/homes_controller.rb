class User::HomesController < ApplicationController
  def top
    @user = current_user
    @random = Liquor.order('RAND()').limit(15)
  end

  def about
  end
end
