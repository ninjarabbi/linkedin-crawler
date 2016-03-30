class CreateProfileSkills < ActiveRecord::Migration
  def change
    create_table :profile_skills do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :skill, index: true
      t.integer :count
      t.timestamps null: false
    end
  end
end
