require 'spec_helper'
require 'models/validate_presence_examples'

describe User do
  it_behaves_like "validate presence", [:email, :password, :password_confirmation]

  before do
    User.create!({:email => "abc@123.com",
                  :password => "password", 
                  :password_confirmation => "password"})
  end

  it "creates a valid user" do
    expect(User.count).to eq(1)
  end

  it "does not accept a password that is too short" do
    user = User.new(:password => "one")
    user.valid?

    expect(user).to have(1).error_on(:password)
  end

  it "does not accept a badly formatted email address" do
    user = User.new(:email => "abc")
    user.valid?

    expect(user).to have(1).error_on(:email)
  end

  it "makes sure email addresses are unique" do
    user = User.new(:email => "abc@123.com")
    user.valid?

    expect(user).to have(1).error_on(:email)
  end

  it "ignores case when comparing emails" do
    user = User.new(:email => "ABC@123.com")
    user.valid?

    expect(user).to have(1).error_on(:email)
  end
end
