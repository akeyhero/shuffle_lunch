require 'rails_helper'

RSpec.describe "participations/show", type: :view do
  let!(:participation) { create :participation }

  before(:each) do
    @participation = assign(:participation, participation)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(participation.event.title)
    expect(rendered).to match(participation.user.nickname)
  end
end
