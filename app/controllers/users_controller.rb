class UsersController < ApplicationController

  def index
    @users = User.all

    @users = User.search_by_skills(params[:search]) if params[:search].present?

  end

  def job_applications
    @user = current_user
    @applications = current_user.job_applications
  end

  def profile
    # Possible if statement to show users' profiles to companies
    # if user_signed_in?
      @user = current_user
      @applications = current_user.job_applications
    # elsif company_signed_in?
    #  User.show
    #end
  end

  def show
    @user= User.find(params[:id])
  end


end
