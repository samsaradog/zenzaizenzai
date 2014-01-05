require 'spec_helper'
require 'presenters/jewel_presenter'

describe Zenzai::JewelPresenter do
  before do
    @jewel = Factory.create_jewel({:quote => ("abc" * 99),
                                   :comment => ("def" * 99),
                                   :citation => ("ghi" * 19),
                                  })
  end

  context "bare fields" do
    before do
      @presenter = described_class.new(@jewel)
    end

    %w(id source citation quote comment).each do |name|
      it "returns the #{name}" do
        expect(@presenter.send(name.to_sym)).to eq(@jewel.send(name.to_sym))
      end
    end
  end

  context "trimmed fields" do
    before do
      @length = 20
      @presenter = described_class.new(@jewel)
    end

    it "returns the first n chars of the citation" do
      expect(@presenter.trim_citation(@length).length).to eq(@length)
    end

    it "returns the first n chars of the quote" do
      expect(@presenter.trim_quote(@length).length).to eq(@length)
    end

    it "returns the first n chars of the comment" do
      expect(@presenter.trim_comment(@length).length).to eq(@length)
    end
  end

  context "unicode eol substitution" do
    it "adds <br> codes for unicode eol in the quote" do
      jewel = Factory.create_jewel({:quote => "abc\u2028def"})
      presenter = described_class.new(jewel)

      expect(presenter.html_quote).to eq("abc<br>def")
    end
  end
end
