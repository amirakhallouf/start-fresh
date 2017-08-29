class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:home]
  #skip_before_action :authenticate_company!, only: [:home]

  def home
    @users = User.all
  end

  def job_search
    @job_offers = JobOffer.all
  end

  def about

  end

end
