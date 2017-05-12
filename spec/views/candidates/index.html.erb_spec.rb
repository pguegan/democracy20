require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(name: "Foo", votes: 100),
      Candidate.create!(name: "Bar", votes: 200)
    ])
  end

  it "renders a list of candidates" do
    render
  end
end
