require 'spec_helper'
include Warden::Test::Helpers

feature 'User likes a review', %{
  An a logged-in user,
  I should be able to mark a review as one I like,
  So reviewers get credit for good reviews
  } do

  given(:user)  { FactoryGirl.create(:user) }
  given(:movie)  { FactoryGirl.create(:movie) }
  given(:review) { FactoryGirl.create(:review, movie: movie) }

  background do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'Guest cannot like a review'
  #   movie
  #   visit root_path
  #   click_link 'Sign Out'
  #   within('.recently_added_movies') do
  #     click_link movie.title
  #   end
  #   page.should have_content(movie.title)
  # end

  scenario 'Signed in user can like a movie' do
    movie
    review
    visit root_path
    within('.movies') do
      click_link movie.title
    end
    within('.review_likes') do
      click_button 'Like review'
    end
    within('.review_likes') do
      page.should have_content('1 like')
    end
  end

  scenario 'Signed in user can see a list of all the movies they liked'
  #   visit root_path
  #   click_link 'Add a new movie'
  #   fill_in 'Title', :with => 'Mulan'
  #   fill_in 'Year', :with => '1996'
  #   click_button 'Enter'
  #   click_button 'Like movie'
  #   within('.liked_movies') do
  #     page.should have_content('Mulan (1996)')
  #   end
  # end
end
