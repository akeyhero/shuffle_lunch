require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  let(:group) { create :group }

  before(:each) do
    @group = assign(:group, group)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(group.event.title)
  end
end
