require 'rails_helper'

RSpec.describe "candidates/show", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(name: "Foo"))
  end

  it "renders attributes in <p>" do
    render
  end
end
