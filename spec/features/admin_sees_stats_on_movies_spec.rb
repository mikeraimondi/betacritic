require 'spec_helper'
include Warden::Test::Helpers

feature 'Admin sees stats on movies', %{
  As an Administrator
  I should be able to see stats about each movie
  So I can see the most popular movies
  } do

  given(:user) { FactoryGirl.create(:user) }
  given(:admin) { FactoryGirl.create(:admin) }
  given(:movie) { FactoryGirl.create(:movie) }
  given(:viewing1) { FactoryGirl.create(:viewing, viewable: movie) }
  given(:viewing2) { FactoryGirl.create(:viewing, viewable: movie) }
  given(:viewing3) { FactoryGirl.create(:viewing, viewable: movie) }
  given(:review1) { FactoryGirl.create(:review, movie: movie) }
  given(:review2) { FactoryGirl.create(:review, movie: movie) }
  given(:like1) { FactoryGirl.create(:like, likable: movie) }
  given(:like2) { FactoryGirl.create(:like, likable: movie) }

  scenario 'Guest cannot see movie stats' do
    visit admin_movies_path
    page.should have_content('You are not authorized!')
  end

  scenario 'User cannot see movie stats unless they are an admin' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit admin_movies_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Admin sees movie stats' do
    movie
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Movie stats'
    page.should have_content(movie.title)
  end

  scenario 'Admin sees how many reviews a movie has' do
    movie
    review1
    review2
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Movie stats'
    page.should have_content('2 reviews')
  end

  scenario 'Admin sees how many likes a movie has' do
    movie
    like1
    like2
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Movie stats'
    page.should have_content('2 likes')
  end

  scenario 'Admin sees how many pageviews a movie has' do
    movie
    viewing1
    viewing2
    viewing3
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Movie stats'
    page.should have_content('3 viewings')
  end

end
