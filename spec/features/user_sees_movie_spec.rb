require 'spec_helper'

feature 'User sees a movie', %{
  As a User
  I want to go to the page for any movie
  so I can see the reviews for the movie
  } do

  scenario "User can select a movie from list" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    expect(page).to have_link(movie.title)
  end

  scenario "User sees a page for the movie" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    first(:link, movie.title).click
    expect(page).to have_css('h1', text: movie.title)
  end

  scenario "User sees reviews for the movie"

end
