require 'spec_helper'
require 'models/validate_presence_examples'
require 'models/validate_boolean_examples'
require 'support/factory'

describe User do
  it_behaves_like "validate presence", [:email, 
                                        :password]

  it_behaves_like "validate boolean", [:is_admin, :gets_daily_dharma]

  before do
    @user = Factory.create_user
  end

  it "creates a valid user" do
    expect(User.count).to eq(1)
  end

  it "does not accept a password that is too short" do
    user = User.new(:password => "one")
    user.valid?

    expect(user.errors[:password].size).to eq(1)
  end

  it "does not accept a badly formatted email address" do
    user = User.new(:email => "abc")
    user.valid?

    expect(user.errors[:email].size).to eq(1)
  end

  it "makes sure email addresses are unique" do
    user = User.new(:email => "abc@123.com")
    user.valid?

    expect(user.errors[:email].size).to eq(1)
  end

  it "ignores case when comparing emails" do
    user = User.new(:email => "ABC@123.com")
    user.valid?

    expect(user.errors[:email].size).to eq(1)
  end

  context "showing whether the user is an admin" do
    it "returns false when not an admin" do
      expect(@user.is_admin?).to be_falsy
    end

    it "returns true when an admin" do
      @user.is_admin = true
      expect(@user.is_admin?).to be_truthy
    end
  end

  it "sets the default for gets_daily_dharma to true" do
    new_user = User.new
    expect(new_user.gets_daily_dharma).to be_truthy
  end
end
