require 'spec_helper'

shared_examples_for 'validate presence' do |fields|
  fields.each do |field|
    it "requires #{field.to_s}" do
      model = described_class.new
      model.send("#{field.to_sym}=", nil)
      model.valid?

      expect(model.errors[field.to_sym]).not_to be_empty
    end
  end
end
