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

  scenario 'User cannot submit if required fields are missing' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => ''
    fill_in 'Year', :with => ''
    fill_in 'Contributor', :with => ''
    click_button 'Enter'
    page.should have_content("can't be blank")
  end

  scenario 'User creates a new movie gets directed to its movie show page' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end

  scenario 'When user creates a new movie, it gets added to movies index' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    visit root_path
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end
end