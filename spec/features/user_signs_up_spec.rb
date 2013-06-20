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
    confirmation_link = "/users/confirmation?confirmation_token=#{User.last.confirmation_token}"
    visit confirmation_link
    page.should have_content('You are now signed in')
    page.should_not have_content('Sign up')
  end
end
