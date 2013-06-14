require 'spec_helper'

feature 'User adds a movie', %{
  As a User
  I want to see a list of the 3 most recently added movies
  so I can see what's new
  } do

  given(:password)  { "password" }
  given(:user)      { FactoryGirl.create(:user, password: password, password_confirmation: password) }

  scenario 'User can add a new movie and it will be top on recently added movies list' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => password
    click_button 'Sign in'
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    click_button 'Enter'
    page.should have_content('Recently added movies The Hangover')
  end
end
