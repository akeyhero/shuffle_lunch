require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :event => nil
      ),
      Group.create!(
        :event => nil
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
