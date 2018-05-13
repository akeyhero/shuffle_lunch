require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  let(:event) { create :event }

  before(:each) do
    assign(:groups, [
      Group.create!(
        :event => event
      ),
      Group.create!(
        :event => event
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => event.title, :count => 2
  end
end
