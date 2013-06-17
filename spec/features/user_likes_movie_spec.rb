require 'spec_helper'
include Warden::Test::Helpers

feature 'User likes a movie', %{
  As a logged-in user
  I should be able to mark a movie as one I like
  So I can see a list of all the movies that I like
  } do

  given(:user)  { FactoryGirl.create(:user) }

  background do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario 'Guest cannot like movie' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'Mulan'
    fill_in 'Year', :with => '1996'
    click_button 'Enter'
    click_link 'Sign Out'
    within('.recently_added_movies') do
      click_link 'Mulan (1996)'
    end
    page.should_not have_content('Like movie')
  end

  scenario 'Signed in user can like a movie'

  scenario 'Signed in user can see a list of all the movies they liked'
end