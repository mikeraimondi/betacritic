require 'spec_helper'

feature 'User reviews a movie', %{
  As a User
  I want to add a review of a movie
  so I can share my opinion of a movie
  } do

  scenario 'User can submit only if movie has a review and rating' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    fill_in 'Review', :with => 'It was hilarious!'
    fill_in 'Rating', :with => '6'
    click_button 'Enter'
    page.should have_content('successfully created')
  end

  scenario 'When user adds a review, user gets directed to its movie show page' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    fill_in 'Review', :with => 'It was hilarious!'
    fill_in 'Rating', :with => '6'
    click_button 'Enter'
    page.should have_content('hilarious')
  end

  scenario 'User cannot submit review if required fields are missing' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    fill_in 'Review', :with => 'It was hilarious!'
    fill_in 'Rating', :with => '6'
    click_button 'Enter'
    page.should have_content("can't be blank")
  end

  scenario 'Review goes to top of list when added'

end