Given(/^there is a print technology with "([^"]*)" name$/) do |name|
  FactoryBot.create(:print_technology, name: name)
end

When(/^I visit print technologies page$/) do
  visit print_technologies_path
end

When(/^I visit new print technology page$/) do
  visit new_print_technology_path
end

When(/^I visit edit print technology page for "([^"]*)"$/) do |name|
  visit edit_print_technology_path(PrintTechnology.find_by(name: name))
end

Then(/^I should see the print technology with "([^"]*)" name$/) do |name|
  expect(page).to have_content(name)
end

Then(/^I should not see the print technology with "([^"]*)" name$/) do |name|
  expect(page).not_to have_content(name)
end
