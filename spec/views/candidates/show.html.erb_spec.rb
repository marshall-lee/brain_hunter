require 'rails_helper'

RSpec.describe "candidates/show", :type => :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :name => "Name",
      :email => "Email",
      :expected_salary => 1,
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
