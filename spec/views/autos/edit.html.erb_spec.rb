require 'rails_helper'

RSpec.describe "autos/edit", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!())
  end

  it "renders the edit auto form" do
    render

    assert_select "form[action=?][method=?]", auto_path(@auto), "post" do
    end
  end
end
