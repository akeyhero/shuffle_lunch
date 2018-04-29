require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :min_member => 2,
      :max_member => 4,
      :max_group_member => 3,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
  end
end
