require 'rails_helper'

RSpec.describe "friends/index", type: :view do
  before(:each) do
    assign(:friends, [
      Friend.create!(
        :name => "Name",
        :contact => "Contact",
        :catchup_period => 1
      ),
      Friend.create!(
        :name => "Name",
        :contact => "Contact",
        :catchup_period => 1
      )
    ])
  end

  it "renders a list of friends" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
