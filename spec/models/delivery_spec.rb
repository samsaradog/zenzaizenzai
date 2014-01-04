require 'spec_helper'
require 'models/validate_presence_examples'

describe Delivery do
  it_behaves_like "validate presence", [:date, :jewel_id]

  it "has an associated jewel" do
    jewel = Factory.create_jewel
    delivery = Delivery.create(:date => Date.today, :jewel_id => jewel.id)

    expect(delivery.jewel).to eq(jewel)
  end
end
