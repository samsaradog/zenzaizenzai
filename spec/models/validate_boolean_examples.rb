require 'spec_helper'

shared_examples_for "validate boolean" do |fields|
  fields.each do |field|
    it "requires #{field.to_s} to be boolean" do
      model = described_class.new
      model.send("#{field}=".to_sym, nil)
      model.valid?
      model.should have_at_least(1).errors_on(field.to_sym)
    end

    [true, false].each do |option|    
      it "allows #{field.to_s} to be '#{option.to_s}'" do
        model = described_class.new     
        model.send("#{field}=".to_sym, option)
        model.valid?
        model.errors_on(field.to_sym).should == []
      end
    end
  end
end 
