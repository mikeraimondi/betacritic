require 'spec_helper'

feature 'User reviews a movie', %{
  As a User
  I want to add a review of a movie
  so I can contribute my opinions of the movie to its page
  } do

  scenario "User sees a list of movies to review" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    expect(page).to have_link(movie.title)
  end

  scenario "User clicks 'add a review' to review a movie" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    click_link 'Add a review'
    expect(page).to have_content("Review #{movie.title}")
  end

  scenario "User sees a form to input a review" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    expect(page).to have_field('review[body]')
  end

  scenario "User must input text for review" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    fill_in 'body'
    click_button 'Save review'
    expect(page).to have_content('Your review successfully saved.')
  end

  # scenario "User must input rating of movie" do
  #   movie = FactoryGirl.create(:movie)
  #   visit movie_path(movie)
  # end
  
  scenario "User saves the review"

end