class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
	@skills = @user.skills.paginate(page: params[:page], per_page: 10)
  end

  def new
  end
  
  private
	  def user_params
		params.require(:user).permit(:name)
	  end

	  # Confirms the correct user.
	  def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	  end
  
end
