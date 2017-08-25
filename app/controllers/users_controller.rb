class UsersController < ApplicationController

  def job_applications
    @user = current_user
    @applications = current_user.job_applications
  end

  def profile
    @user = current_user
    @applications = current_user.job_applications
  end
end
