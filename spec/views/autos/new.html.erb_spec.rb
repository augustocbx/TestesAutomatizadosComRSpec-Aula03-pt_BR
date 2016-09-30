require 'rails_helper'

RSpec.describe "autos/new", type: :view do
  before(:each) do
    assign(:auto, Auto.new())
  end

  it "renders new auto form" do
    render

    assert_select "form[action=?][method=?]", autos_path, "post" do
    end
  end
end
