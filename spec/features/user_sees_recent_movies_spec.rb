require 'spec_helper'

feature 'User adds a movie', %{
  As a User
  I want to add a movie for review
  so I can review it later
  } do

  scenario 'User can submit only if title and year are valid' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    page.should have_content('successfully created')
  end
end