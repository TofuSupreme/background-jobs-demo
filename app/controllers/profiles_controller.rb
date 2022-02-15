class ProfilesController < ApplicationController
  def update
    if current_user.update(user_params)
      UpdateUserJob.perform_later(current_user) #the job is queued
      redirect_to root_path, notice: "Profile updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
