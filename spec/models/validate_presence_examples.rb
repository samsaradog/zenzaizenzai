require 'spec_helper'

shared_examples_for 'validate presence' do |fields|
  fields.each do |field|
    it "requires #{field.to_s}" do
      model = described_class.new
      model.send("#{field.to_sym}=", nil)
      model.valid?

      model.should have_at_least(1).error_on(field.to_sym)
    end
  end
end
