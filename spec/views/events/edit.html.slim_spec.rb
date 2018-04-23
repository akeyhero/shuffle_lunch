require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :min_member => 1,
      :max_member => 1,
      :max_group_member => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[title]"

      assert_select "input[name=?]", "event[min_member]"

      assert_select "input[name=?]", "event[max_member]"

      assert_select "input[name=?]", "event[max_group_member]"

      assert_select "textarea[name=?]", "event[description]"
    end
  end
end
