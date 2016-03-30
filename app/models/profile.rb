class Profile < ActiveRecord::Base
  has_many :profile_skills
  has_many :skills, through: :profile_skills

  def self.build_profile(page)

    profile = Profile.new()
    skills = []
    page.css("#skills li").each do |s|
      skills.push(s.text)
    end

    profile.name = page.css("#name").text
    profile.title = page.css(".profile-overview-content .title").text
    profile.position = page.css(".org a").text
    profile.summary = page.css("#summary .description").text
    # self.skills = skills

    profile.save
    profile

  end
end
