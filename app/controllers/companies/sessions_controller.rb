class Companies::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    company_profile_path
  end
end
