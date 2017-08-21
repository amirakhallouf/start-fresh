class JobOffer < ApplicationRecord
  belongs_to :company
  has_many :job_applications
end
