require 'rails_helper'

RSpec.describe "friends/show", type: :view do
  before(:each) do
    @friend = assign(:friend, Friend.create!(
      :name => "Name",
      :contact => "Contact",
      :catchup_period => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Contact/)
    expect(rendered).to match(/1/)
  end
end
