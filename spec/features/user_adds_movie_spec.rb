require 'spec_helper'
include Warden::Test::Helpers

feature 'User adds a movie', %{
  As a User
  I want to add a movie for review
  so I can review it later
  } do

  given(:user)  { FactoryGirl.create(:user) }

  background do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'Guest cannot submit movie' do
    visit root_path
    click_link 'Sign Out'
    page.should_not have_content('Add a new movie')
  end

  scenario 'Signed in user can submit movie' do
    visit root_path
    page.should have_content('Add a new movie')
  end

  scenario 'User can submit only if title and year are valid' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    click_button 'Enter'
    page.should have_content('successfully created')
  end

  scenario 'User cannot submit if required fields are missing' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => ''
    fill_in 'Year', :with => ''
    click_button 'Enter'
    page.should have_content("can't be blank")
  end

  scenario 'User creates a new movie gets directed to its movie show page' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    click_button 'Enter'
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end

  scenario 'When user creates a new movie, it gets added to movies index' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    click_button 'Enter'
    visit root_path
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end

  scenario 'User browses movies alphabetically'
  # should we user the orderly gem?
end
