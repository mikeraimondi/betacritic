require 'spec_helper'

feature 'User signs in', %{
  As a user,
  I want to sign in
  so I can resume using the app.
  } do

  scenario 'User can sign in from the landing page' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    click_button 'Sign up'
    click_link 'Sign Out'
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'Password', :with => 'qwertyuiop'
    click_button 'Sign in'
    page.should have_content('Signed in successfully')
    page.should have_content('Sign Out')
  end
end