class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      # Log the user in and redirect to the user's show page.
	  log_in(@user)
	  redirect_to user_url(@user)
    else
      # Create an error message.
	  flash.now[:danger] = 'User "' + params[:session][:name]  + '" does not exist.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
