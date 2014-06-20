require 'rails_helper'

RSpec.describe Job, :type => :model do
  it { should validate_presence_of :title }

  describe "actual scope" do
    it "presents" do
      expect(Job).to respond_to :actual
    end

    it "doesn't return expired jobs" do
      actual_job = FactoryGirl.create(:job)
      expired_job = FactoryGirl.create(:job, expires_at: Time.now - 1.day)
      expect(Job.all).to be_include(actual_job).and be_include(expired_job)
      expect(Job.actual).to be_include(actual_job)
      expect(Job.actual).not_to be_include(expired_job)
    end
  end

  describe "skills" do
    it "responds to scopes and methods provided by ActsAsTaggableOn" do
      expect(Job).to respond_to(:skill_counts)
      job = FactoryGirl.build :job
      expect(job).to respond_to(:skill_list)
      expect(job).to respond_to(:find_related_skills_for)
    end
  end
end
