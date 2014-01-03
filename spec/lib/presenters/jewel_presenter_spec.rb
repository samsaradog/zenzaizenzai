require 'spec_helper'
require 'presenters/jewel_presenter'

describe Zenzai::JewelPresenter do
  before do
    @jewel = Factory.create_jewel({:quote => ("abc" * 99),
                                   :comment => ("def" * 99),
                                   :citation => ("ghi" * 19),
                                  })
  end

  it "returns the id" do
    expect(described_class.new(@jewel).id).to eq(@jewel.id)
  end

  it "returns the source" do
    expect(described_class.new(@jewel).source).to eq(@jewel.source)
  end

  it "returns the citation" do
    expect(described_class.new(@jewel).citation).to eq(@jewel.citation)
  end

  context "trimming fields" do
    before do
      @length = 20
    end

    it "returns the first n chars of the citation" do
      expect(described_class.new(@jewel).trim_citation(@length).length).to eq(@length)
    end

    it "returns the first n chars of the quote" do
      expect(described_class.new(@jewel).trim_quote(@length).length).to eq(@length)
    end

    it "returns the first n chars of the comment" do
      expect(described_class.new(@jewel).trim_comment(@length).length).to eq(@length)
    end
  end
end
