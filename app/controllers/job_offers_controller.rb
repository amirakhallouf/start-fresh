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

  def new
    @job_offer= JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.status = "open"
    @job_offer.company_id = current_company.id
    if @job_offer.save
      redirect_to job_offer_path(@job_offer)
    else
      render :new
    end
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :location, :description)
  end
end
