require 'rails_helper'

RSpec.describe "jobs/edit", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "MyString",
      :salary => 1,
      :email => "MyString"
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "input#job_salary[name=?]", "job[salary]"

      assert_select "input#job_email[name=?]", "job[email]"
    end
  end
end
