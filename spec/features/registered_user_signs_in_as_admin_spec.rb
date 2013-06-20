require 'spec_helper'
include Warden::Test::Helpers

feature 'Registered user signs in as admin', %{
  As a registered user with admin privileges,
  I should be able to login and be an admin
  So I can have admin privileges on the site
  } do

  given(:user)  { FactoryGirl.create(:user) }
  given(:admin)  { FactoryGirl.create(:admin) }

  scenario 'Guest cannot see a link to admin dashboard' do
    visit root_path
    page.should_not have_content('Admin dashboard')
  end

  scenario 'Guest cannot see the admin dashboard by url' do
    visit admin_path
    page.should have_content('You are not authorized!')
  end

  scenario 'User that is not an admin cannot see a link to admin dashboard' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    page.should_not have_content('Admin dashboard')
  end

  scenario 'User cannot see the admin dashboard by url' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit admin_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Admin can get in to admin dashboard' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    page.should have_content('Admin dashboard')
  end

  scenario 'Admin sees list of user in admin dashboard' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    page.should have_content('Admin dashboard')
  end
end
