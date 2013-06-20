require 'spec_helper'

feature 'User signs out', %{
  As a user,
  I want to sign out
  so I don't share my account accidentally.
  } do

  scenario 'User can sign out after signing in' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    click_button 'Sign up'
    confirmation_link = "/users/confirmation?confirmation_token=#{User.last.confirmation_token}"
    visit confirmation_link
    click_link 'Sign Out'
    page.should_not have_content('Sign Out')
  end
end
