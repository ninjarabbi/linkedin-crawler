class Profile < ActiveRecord::Base
  has_many :profile_skills
  has_many :skills, through: :profile_skills
end
