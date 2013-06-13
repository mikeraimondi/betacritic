require 'spec_helper'

feature 'User reviews a movie', %{
  As a User
  I want to add a review of a movie
  so I can share my opinion of a movie
  } do

  # scenario 'User can submit only if title and year are valid' do
  #   visit root_path
  #   click_link 'Add a new movie'
  #   fill_in 'Title', :with => 'The Hangover Part III'
  #   fill_in 'Year', :with => '2013'
  #   fill_in 'Contributor', :with => '1'
  #   click_button 'Enter'
  #   page.should have_content('successfully created')
  # end

  scenario "User sees a list of movies to review" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    expect(page).to have_link(movie.title)
  end

  scenario "User clicks 'add a review' to select a movie to review" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    click_link 'Add a review'
    expect(page).to have_content("Review #{movie.title}")
  end

  scenario "User sees a form to input a review"
  scenario "User must input text for review"
  scenario "User must input rating of movie"
  scenario "User saves the review"
end