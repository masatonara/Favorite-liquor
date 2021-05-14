class ApplicationController < ActionController::Base

  private

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,
  			 keys: [:name, :email, :password])


  def after_sign_in_path_for(resource)
    liquor_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


      #sign_upの際にnameのデータ操作を許。追加したカラム。
  		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])

  end

end
