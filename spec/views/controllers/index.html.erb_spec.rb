require 'rails_helper'

RSpec.describe "controllers/index", type: :view do
  before(:each) do
    assign(:controllers, [
      Controller.create!(
        :charges => "Charges"
      ),
      Controller.create!(
        :charges => "Charges"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    assert_select "tr>td", :text => "Charges".to_s, :count => 2
  end
end
