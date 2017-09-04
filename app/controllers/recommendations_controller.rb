class RecommendationsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]

  def create
    @skill = Skill.find(params[:skill_id])
	@user = User.find(params[:user_id])
	
	begin
	@recommendation = current_user.add_recommendation(@user, @skill)
	if @recommendation.save
		flash[:success] = "Recommendation added!"
	else
		flash[:danger] = @recommendation.errors.full_messages
	end
	
	rescue ActiveRecord::RecordNotUnique => exception
		flash[:danger] = "Can't add duplicate recommendation."
	end
	
    redirect_to request.referrer
  end


  def destroy
  end
end
