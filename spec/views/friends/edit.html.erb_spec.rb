require 'rails_helper'

RSpec.describe "friends/edit", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :name => "MyString",
      :contact => "MyString",
      :catchup_period => 1
    ))
  end

  it "renders the edit friend form" do
    render

    assert_select "form[action=?][method=?]", friend_path(@friend), "post" do

      assert_select "input#friend_name[name=?]", "friend[name]"

      assert_select "input#friend_contact[name=?]", "friend[contact]"

      assert_select "input#friend_catchup_period[name=?]", "friend[catchup_period]"
    end
  end
end
