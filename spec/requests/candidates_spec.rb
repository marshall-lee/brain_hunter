require 'rails_helper'

RSpec.describe "Candidates", :type => :request do
  describe "GET /candidates" do
    it "works! (now write some real specs)" do
      get candidates_path
      expect(response.status).to be(200)
    end
  end
end
