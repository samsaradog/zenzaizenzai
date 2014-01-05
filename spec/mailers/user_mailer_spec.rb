require "spec_helper"
require "presenters/jewel_presenter"

describe UserMailer do
  before do
    @one_user = Factory.create_user
    @second_user = Factory.create_user({:email => "def@123.com"})

    @users = [@one_user, @second_user]
    @jewel = Factory.create_jewel
    @jewel_presenter = Zenzai::JewelPresenter.new(@jewel)

    @mail = UserMailer.daily_dharma(@users, @jewel_presenter)
  end

  it "sets the from address correctly" do
    expect(UserMailer::FROM).to match(@mail.from.first)
  end

  it "sets the to address correctly" do
    expect(UserMailer::FROM).to match(@mail.to.first)
  end

  it "sets the bcc addresses correctly" do
    expect(@mail.bcc).to eq(@users.map(&:email))
  end

  it "sets the subject correctly" do
    expect(@mail.subject).to eq("Daily Dharma")
  end

  it "includes the quote from the jewel" do
    expect(@mail.body.encoded).to match(@jewel_presenter.quote)
  end

  it "includes the comment from the jewel" do
    expect(@mail.body.encoded).to match(@jewel_presenter.comment)
  end
end
