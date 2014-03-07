Given(/^a user in the system$/) do
  @password = "eighty8keys"
  @email = "abc@def.com"
  @user = User.create!(:email => @email,
                       :password => @password,
                       :password_confirmation => @password)
  @user.update_attributes(:confirmed_at => Time.zone.now)
end

Given(/^a jewel in the system$/) do
  Jewel.create!(:source => "abc", :citation => "abc", :quote => "abc", :comment => "abc")
end

Given(/^the user is not subscribed$/) do
  @user.update_attributes(:gets_daily_dharma => false)
end

When(/^the user logs in$/) do
  visit user_session_path
  fill_in "email", :with => @email
  fill_in "password", :with => @password
  click_button "Sign in"
end

When(/^the user edits their profile$/) do
  click_link "Profile"
end

When(/^the user subscribes$/) do
  check("user_gets_daily_dharma")
  fill_in "current password", :with => @password
  click_button "Update"
end

Then(/^they should see that they are subscribed$/) do
  check_box = find('#user_gets_daily_dharma')
  expect(check_box).to be_checked
end
