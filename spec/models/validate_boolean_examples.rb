require 'spec_helper'

shared_examples_for "validate boolean" do |fields|
  fields.each do |field|
    it "requires #{field.to_s} to be boolean" do
      model = described_class.new
      model.send("#{field}=".to_sym, nil)
      model.valid?

      expect(model.errors[field.to_sym]).not_to be_empty
    end

    [true, false].each do |option|    
      it "allows #{field.to_s} to be '#{option.to_s}'" do
        model = described_class.new     
        model.send("#{field}=".to_sym, option)
        model.valid?

        expect(model.errors[field.to_sym]).to be_empty
      end
    end
  end
end 
