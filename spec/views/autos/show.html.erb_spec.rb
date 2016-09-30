require 'rails_helper'

RSpec.describe "autos/show", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
