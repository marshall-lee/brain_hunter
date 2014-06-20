require 'rails_helper'

RSpec.describe "candidates/new", :type => :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :name => "MyString",
      :email => "MyString",
      :expected_salary => 1,
      :status => 1
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input#candidate_name[name=?]", "candidate[name]"

      assert_select "input#candidate_email[name=?]", "candidate[email]"

      assert_select "input#candidate_expected_salary[name=?]", "candidate[expected_salary]"

      assert_select "input#candidate_status[name=?]", "candidate[status]"
    end
  end
end
