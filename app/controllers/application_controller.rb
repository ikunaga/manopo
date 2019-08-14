class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?

def set_current_user
	@current_user = User.find_by(id:  session[:user_id])
end

def authenticate_user
	if @current_user == nil
	redirect_to("/")
    flash[:notice] = "ログインが必要です"
	end
end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :last_name_kana, :first_name_kana, :location, :image, :age, :address, :phone_number, :age_group, skills_attributes: [:id, :skill_name, :category_id, :destroy], ])
    end
end

