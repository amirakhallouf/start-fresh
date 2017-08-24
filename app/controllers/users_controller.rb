class UsersController < ApplicationController



  def profile
    @user = current_user
    @applications = @user.job_applications
  end
end
