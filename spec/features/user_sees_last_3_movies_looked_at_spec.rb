require 'spec_helper'
include Warden::Test::Helpers

feature 'User sees last 3 movies looked at', %{
  As a User
  I want to see a list of the last 3 movies I looked at
  so I can go back quickly to movies
  } do

  given(:user)    { FactoryGirl.create(:user) }
  given!(:movie1)  { FactoryGirl.create(:movie) }
  given!(:movie2)  { FactoryGirl.create(:movie) }
  given!(:movie3)  { FactoryGirl.create(:movie) }

  background do
    Warden.test_mode!
    login_as(user, scope: :user)
  end

  after :each do
    Warden.test_reset!
  end

  scenario "User sees titles of last 3 movies they have looked at" do
    visit root_path
    first('.movies').click_link(movie2.title)
    expect(user.viewings.last.viewable).to eql(movie2)
    visit root_path
    first('.movies').click_link(movie3.title)
    expect(user.viewings.last.viewable).to eql(movie3)
    visit root_path
    first('.movies').click_link(movie1.title)
    expect(user.viewings.last.viewable).to eql(movie1)
    visit root_path
    within first(".recently-viewed") do
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end
  end

  scenario "User can click on a movie and will be taken to that movie's show page" do
    visit root_path
    first('.movies').click_link(movie2.title)
    visit root_path
    first(".recently-viewed").click_link(movie2.title)
    expect(page).to have_css("h1", text: movie2.title)
  end

end
