require 'rails_helper'

RSpec.describe "jobs/new", :type => :view do
  before(:each) do
    assign(:job, Job.new(
      :title => "MyString",
      :salary => 1,
      :email => "MyString"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "input#job_salary[name=?]", "job[salary]"

      assert_select "input#job_email[name=?]", "job[email]"
    end
  end
end
