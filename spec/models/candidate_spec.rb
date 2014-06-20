require 'rails_helper'

RSpec.describe Candidate, :type => :model do
  it { should validate_presence_of(:name) }

  describe "status enumeration" do
    it "responds to scopes and methods provided by Enumerize" do
      expect(Candidate).to respond_to(:with_status)

      candidate = FactoryGirl.build :candidate
      expect(candidate).to respond_to(:searching?)
      expect(candidate).to respond_to(:employed?)
    end

    it "has Enumerize predicates work right" do
      candidate = FactoryGirl.build :candidate
      candidate.status = :searching
      expect(candidate).to be_searching
      expect(candidate).not_to be_employed
      candidate.status = :employed
      expect(candidate).to be_employed
      expect(candidate).not_to be_searching
    end
  end

  describe "skills" do
    it "responds to scopes and methods provided by ActsAsTaggableOn" do
      expect(Candidate).to respond_to(:skill_counts)
      candidate = FactoryGirl.build :candidate
      expect(candidate).to respond_to(:skill_list)
      expect(candidate).to respond_to(:find_related_skills_for)
    end
  end

  describe "related_jobs" do
    before(:each) do
      @candidate = FactoryGirl.create(:candidate, skill_list: "rails, jquery, css")
      @job1 = FactoryGirl.create(:job, skill_list: "rails, css")
      @job2 = FactoryGirl.create(:job, skill_list: "rails, css, jquery")
      @job3 = FactoryGirl.create(:job, skill_list: "jquery")
      @job4 = FactoryGirl.create(:job, skill_list: "django, blowjob")
      @related_jobs = @candidate.related_jobs
    end

    it "just works" do
      expect(@related_jobs).to include(@job1)
      expect(@related_jobs).to include(@job2)
      expect(@related_jobs).to include(@job3)
      expect(@related_jobs).not_to include(@job4)
    end

    it "works with right ordering" do
      expect(@related_jobs).to be == [@job2,@job1,@job3]
    end
  end
end
