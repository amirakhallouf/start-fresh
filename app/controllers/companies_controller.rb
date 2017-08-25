class CompaniesController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end

  def profile
    @company = current_company
    @job_offers = @company.job_offers
  end
end
