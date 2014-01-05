require 'spec_helper'
require 'mailclerk'

describe Zenzai::MailClerk do
  before do
    @first_user = Factory.create_user
    @second_user = Factory.create_user({:email => "ghi@123.com",
                                        :gets_daily_dharma => true})
    @first_jewel = Factory.create_jewel
    @second_jewel = Factory.create_jewel({:source => "123"})

    @today = Date.today

    @first_delivery = Delivery.create!(:date => @today,
                                       :jewel_id => @first_jewel.id)
    @second_delivery = Delivery.create!(:date => @today + 1.day,
                                        :jewel_id => @second_jewel.id)
    @clerk = described_class.new
  end

  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  it "gets the jewel for today" do
    expect(@clerk.current_jewel).to eq(@first_jewel)
  end

  it "gets the right users" do
    expect(@clerk.daily_dharma_recipients).to eq([@second_user])
  end

  it "sends out the email" do
    @clerk.send_daily_dharma
    expect(ActionMailer::Base.deliveries.last.bcc).to eq([@second_user.email])
  end
end
