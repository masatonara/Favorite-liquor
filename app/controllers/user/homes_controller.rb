class User::HomesController < ApplicationController
  def top
    @user = current_user
    @randam = Liquor.order('RANDOM()').limit(15)
  end

  def about
  end
end
