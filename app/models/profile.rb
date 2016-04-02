class Profile < ActiveRecord::Base
  has_many :profile_skills
  has_many :skills, through: :profile_skills

  def self.build_profile(page)

    profile = Profile.new

    profile.name = page.css('#name').text
    profile.title = page.css('.profile-overview-content .title').text
    profile.position = page.css('.org a').text
    profile.summary = page.css('#summary .description').text

    profile.save

    page.css('#skills li a').each do |s|
      skill = Skill.find_or_create_by(name: s.text)
      if skill
        profile.profile_skills.create(skill_id: skill.id)
      end
    end

    profile

  end

  def as_json(options = {})
    super({ only: [:name, :title, :position, :summary], include: { skills: { only: [:name] }} }.merge(options || {}))
  end
end
