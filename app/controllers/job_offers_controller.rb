class JobOffersController < ApplicationController
  def index
    @job_offers = JobOffer.all
    if params[:search] && params[:search] != ''
      @job_offers = @job_offers.where("title ILIKE ?",'%'+params[:search]+'%')
    end
  end
  def show
    @job_offer = JobOffer.find(params[:id])
  end
end
