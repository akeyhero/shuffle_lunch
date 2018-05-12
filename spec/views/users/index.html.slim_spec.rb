require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :nickname => "Nickname"
      ),
      User.create!(
        :nickname => "Nickname"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Nickname".to_s, :count => 2
  end
end
