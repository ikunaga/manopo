class UsersController < ApplicationController
	before_action :authenticate_user!


	def index
		@user = current_user.matchers
		if current_user.age_group == '後輩' then
			@users = User.where(age_group: '先輩')
		elsif current_user.age_group == '先輩' then
			@users = User.where(age_group: '後輩')
		else
			@users = User.all
			flash.now[:alert] = 'ユーザーの年齢層を設定してください'
			render :index
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id !=  params[:id].to_i
	       redirect_to("/")
	    end
	end

	def update
		user = User.find(params[:id])
		    if user.update(user_params)
			    sign_in(user, bypass: true)
			    redirect_to user_path(user.id)
			else
				redirect_to edit_user_path(user.id) ,notice: '入力した値に誤りがあるか、入力されていない箇所があります'
			end
	end


private
    def user_params
      	params.require(:user).permit(:email, :password, :password_confirmation, :name, :last_name, :first_name, :last_name_kana, :first_name_kana, :location, :image, :age, :address, :phone_number, :age_group, skills_attributes: [:id, :skill_name, :category_id, :_destroy])
    end


end
