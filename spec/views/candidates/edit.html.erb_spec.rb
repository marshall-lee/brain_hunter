require 'rails_helper'

RSpec.describe "candidates/edit", :type => :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :name => "MyString",
      :email => "MyString",
      :expected_salary => 1,
      :status => 1
    ))
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do

      assert_select "input#candidate_name[name=?]", "candidate[name]"

      assert_select "input#candidate_email[name=?]", "candidate[email]"

      assert_select "input#candidate_expected_salary[name=?]", "candidate[expected_salary]"

      assert_select "input#candidate_status[name=?]", "candidate[status]"
    end
  end
end
