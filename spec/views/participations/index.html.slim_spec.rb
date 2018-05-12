require 'rails_helper'

RSpec.describe "participations/index", type: :view do
  let!(:event) { create :event }
  let!(:users) { create_list :user, 2 }

  before(:each) do
    assign(:participations, [
      Participation.create!(
        :event => event,
        :user => users[0]
      ),
      Participation.create!(
        :event => event,
        :user => users[1]
      )
    ])
  end

  it "renders a list of participations" do
    render
    assert_select "tr>td", :text => event.title, :count => 2
    assert_select "tr>td", :text => users[0].nickname, :count => 1
    assert_select "tr>td", :text => users[1].nickname, :count => 1
  end
end
