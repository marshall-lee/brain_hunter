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

  describe "related_candidates" do
    before(:each) do
      @job = FactoryGirl.create(:job, skill_list: "rails, jquery, css")
      @candidate1 = FactoryGirl.create(:candidate, skill_list: "rails, css")
      @candidate2 = FactoryGirl.create(:candidate, skill_list: "rails, css, jquery")
      @candidate3 = FactoryGirl.create(:candidate, skill_list: "jquery")
      @candidate4 = FactoryGirl.create(:candidate, skill_list: "django, blowjob")
      @related_candidates = @job.related_candidates
    end

    it "just works" do
      expect(@related_candidates).to include(@candidate1)
      expect(@related_candidates).to include(@candidate2)
      expect(@related_candidates).to include(@candidate3)
      expect(@related_candidates).not_to include(@candidate4)
    end

    it "works with right ordering" do
      expect(@related_candidates).to be == [@candidate2,@candidate1,@candidate3]
    end
  end
end
