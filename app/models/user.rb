class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :picture, PhotoUploader

  include PgSearch
    pg_search_scope :search_by_skills, against: [:skills, :education, :bio]

  has_many :job_applications
end
