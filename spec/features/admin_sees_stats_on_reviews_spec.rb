require 'spec_helper'
include Warden::Test::Helpers

feature 'Admin sees stats on reviews', %{
  As an admin,
  I should be able to see stats about each review,
  So I can see which reviews are the most popular
  } do

  given(:user) { FactoryGirl.create(:user) }
  given(:admin) { FactoryGirl.create(:admin) }
  given(:movie) { FactoryGirl.create(:movie) }
  given(:review) { FactoryGirl.create(:review, movie: movie) }
  given(:like1) { FactoryGirl.create(:like, likable: review) }
  given(:like2) { FactoryGirl.create(:like, likable: review) }

  scenario 'Guest cannot see review stats' do
    visit admin_reviews_path
    page.should have_content('You are not authorized!')
  end

  scenario 'User cannot see review stats unless they are an admin' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    visit admin_reviews_path
    page.should have_content('You are not authorized!')
  end

  scenario 'Admin sees review stats' do
    movie
    review
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Review stats'
    page.should have_content(review.body)
  end

  scenario 'Admin sees how many likes a review has' do
    movie
    review
    like1
    like2
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'
    click_link 'Admin dashboard'
    click_link 'Review stats'
    page.should have_content('2 likes')
  end

end
