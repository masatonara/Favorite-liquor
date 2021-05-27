class User::HomesController < ApplicationController
  def top
    @user = current_user
    @random = Liquor.order('RANDOM()').limit(15)
  end

  def about
  end
end
