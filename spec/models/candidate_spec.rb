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

end
