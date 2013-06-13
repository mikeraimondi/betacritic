require 'spec_helper'

feature 'Visitor signs up', %{
  As a visitor,
  I want to sign up
  so I can use the app.
  } do

  scenario 'Visitor can sign up from the landing page' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', :with => 'user@gmail.com'
    fill_in 'user[password]', :with => 'qwertyuiop'
    fill_in 'user[password_confirmation]', :with => 'qwertyuiop'
    click_button 'Sign up'
    page.should have_content('You have signed up successfully')
    page.should_not have_content('Sign up')
  end
end