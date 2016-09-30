require 'rails_helper'

RSpec.describe "autos/index", type: :view do
  before(:each) do
    assign(:autos, [
      Auto.create!(),
      Auto.create!()
    ])
  end

  it "renders a list of autos" do
    render
  end
end
