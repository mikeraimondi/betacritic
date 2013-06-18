require 'spec_helper'
include Warden::Test::Helpers

feature 'Registered user signs in as admin', %{
  As a registered user with admin privileges,
  I should be able to login and be an admin
  So I can have admin privileges on the site
  } do

  given(:user)  { FactoryGirl.create(:user) }
  given(:admin)  { FactoryGirl.create(:admin) }

  scenario 'Admin sees a link to admin dashboard' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    page.should have_content(user.email)
  end
end
