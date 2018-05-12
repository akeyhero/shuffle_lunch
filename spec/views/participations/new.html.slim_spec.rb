require 'rails_helper'

RSpec.describe "participations/new", type: :view do
  before(:each) do
    assign(:participation, Participation.new(
      :event => nil,
      :user => nil
    ))
  end

  it "renders new participation form" do
    render

    assert_select "form[action=?][method=?]", participations_path, "post" do

      assert_select "input[name=?]", "participation[event_id]"

      assert_select "input[name=?]", "participation[user_id]"
    end
  end
end
