require 'spec_helper'

feature 'User reviews a movie', %{
  As a User
  I want to add a review of a movie
  so I can contribute my opinions of the movie to its page
  } do

before(:each) do
  user = FactoryGirl.create(:user)
  sign_in(user)
end

  def sign_in(user)
    visit '/users/sign_in'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    page.should have_content('Signed in successfully')
  end

  scenario "User sees a list of movies to review" do
    movie = FactoryGirl.create(:movie)
    visit root_path
    expect(page).to have_link(movie.title)
  end

  scenario "User sees a form to input a review" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    expect(page).to have_field("review_body")
  end

  scenario "User must input text for review" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    fill_in 'review_body', with: ''
    click_button 'Create Review'
    expect(page).to have_content("can't be blank")
  end

  scenario "User must input rating of movie" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    expect(page).to have_content("can't be blank")
  end
  
  scenario "User saves the review" do
    movie = FactoryGirl.create(:movie)
    visit movie_path(movie)
    fill_in 'Body', with: 'Review'
    choose '6'
    click_button 'Create Review'
    expect(page).to have_content("Review was successfully created")
    review = movie.reviews.first
    expect(review.body).to eql('Review')
    expect(review.rating).to eql(6)
  end

end