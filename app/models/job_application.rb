class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer
  validates(:personal_motivation, presence: true, length: {maximum: 200})
end
