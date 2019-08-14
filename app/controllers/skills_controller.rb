class SkillsController < ApplicationController
	def new
		@skill = Skill.new
		@skills = Skill.all
		@skills = current_user.skills
	end

	def create
		skill = Skill.new(skill_params)
		skill.user_id = current_user.id
		if skill.save!
			redirect_to new_skill_path
		else
			redirect_to new_skill_path ,notice: 'うまく保存されませんでした。お手数ですが、再度実行してください'
		end
	end

	def destroy
	    skilld = Skill.find(params[:id])
	    skilld.destroy
	    redirect_to new_skill_path
	end


private
	def skill_params
		params.require(:skill).permit(:skill_name, :category_id)
	end


end
