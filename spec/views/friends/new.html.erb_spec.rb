require 'rails_helper'

RSpec.describe "friends/new", type: :view do
  before(:each) do
    assign(:friend, Friend.new(
      :name => "MyString",
      :contact => "MyString",
      :catchup_period => 1
    ))
  end

  it "renders new friend form" do
    render

    assert_select "form[action=?][method=?]", friends_path, "post" do

      assert_select "input#friend_name[name=?]", "friend[name]"

      assert_select "input#friend_contact[name=?]", "friend[contact]"

      assert_select "input#friend_catchup_period[name=?]", "friend[catchup_period]"
    end
  end
end
