require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nickname => "Nickname1"
      ),
      User.create!(
        :nickname => "Nickname2"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Nickname1".to_s, :count => 1
    assert_select "tr>td", :text => "Nickname2".to_s, :count => 1
  end
end
