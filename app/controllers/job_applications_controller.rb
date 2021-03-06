class JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.all
  end

  def show
    @job_application = JobApplication.find(params[:id])
    @user = @job_application.user
  end

  def new
    @job_application = JobApplication.new
    @job_offer = JobOffer.find(params[:job_offer_id])
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    @job_application.user = current_user
    @job_application.status = "Pending"
    @job_application.job_offer = JobOffer.find(params[:job_offer_id])
    if @job_application.save
      redirect_to job_offer_path(@job_application.job_offer)
    end
  end

  def accept_application
    @job_application = JobApplication.find(params[:job_application_id])
    @job_application.status = "Accepted"
    @job_application.save
    redirect_to @job_application.job_offer, notice: "Application accepted. Applicant informed."
  end

  def decline_application
    @job_application = JobApplication.find(params[:job_application_id])
    @job_application.status = "Declined"
    @job_application.save
    redirect_to @job_application.job_offer, notice: "Application declined. Applicant informed."
  end

  private

  def job_application_params
    params.require(:job_application).permit(:personal_motivation)
  end

end
