Given(/^I am logged in$/) do
  @name = 'Meg Howie'
  @email = 'meg@howie.com'
  password = 'password'
  @is_admin ||= false
  @user = User.create!(name: @name, email: @email, password: password, is_admin: @is_admin)
  visit new_user_session_path
  find('.simple_form.user').fill_in 'user_email', with: @email
  find('.simple_form.user').fill_in 'user_password', with: password
  click_on 'log-in-btn'
end

Given(/^I am logged in as an admin$/) do
  @is_admin = true
  step 'I am logged in'
end

Then(/^I should be asked to log in$/) do
  expect(page).to have_css('body.sessions.new')
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I visit the home page$/) do
  visit '/'
end

When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end

When(/^I click "(.*?)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  expect(page).not_to have_content(arg1)
end

Then(/^I should be redirected to the home page and told I don't have priviledges$/) do
  expect(current_path).to eq(root_path)
  expect(page).to have_content("Sorry, looks like you don't have permission to do that.")
end
