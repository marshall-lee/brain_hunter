require 'rails_helper'

RSpec.describe "candidates/index", :type => :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        :name => "Name",
        :email => "Email",
        :expected_salary => 1,
        :status => 2
      ),
      Candidate.create!(
        :name => "Name",
        :email => "Email",
        :expected_salary => 1,
        :status => 2
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
