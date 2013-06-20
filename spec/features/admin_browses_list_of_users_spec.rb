require 'spec_helper'
include Warden::Test::Helpers

feature 'Admin browses list of users', %{
  As an admin,
  I want to be able to browse a list of users,
  So I can see who is using the app
  } do

  given(:user) { FactoryGirl.create(:user) }
  given(:admin) { FactoryGirl.create(:admin) }

  scenario 'Guest cannot see list of users by url' do
    visit users_path
    page.should have_content('You are not authorized!')
  end

  scenario 'User cannot see list of users by url' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit users_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Admin sees email address of each user' do
    user
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'User stats'
    page.should have_content(user.email)
  end

  scenario 'Clicking on a user email brings admin to respective user summary page' do
    user
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'User stats'
    click_link user.email
    page.should have_content(user.email)
  end

end
