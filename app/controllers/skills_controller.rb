class SkillsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @skill = current_user.skills.build(skill_params)
	begin
		if @skill.save
		  flash[:success] = "Skill added!"
		else
		  flash[:danger] = @skill.errors.full_messages
		end
	
	rescue ActiveRecord::RecordNotUnique => exception
		flash[:danger] = "Can't add duplicate skill."
	end
    redirect_to request.referrer
  end


  def destroy
  end
  
  private

    def skill_params
      params.require(:skill).permit(:name)
    end
  
end
