require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "Title",
      :salary => 1,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
  end
end
