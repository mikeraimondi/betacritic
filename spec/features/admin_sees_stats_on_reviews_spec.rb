require 'spec_helper'
include Warden::Test::Helpers

feature 'Admin sees stats on reviews', %{
  As an admin,
  I should be able to see stats about each review,
  So I can see which reviews are the most popular
  } do

  # given(:user) { FactoryGirl.create(:user) }
  # given(:admin) { FactoryGirl.create(:admin) }
  # given(:movie) { FactoryGirl.create(:movie) }
  # given(:review1) { FactoryGirl.create(:review, movie: movie) }
  # given(:review2) { FactoryGirl.create(:review, movie: movie) }
  # given(:like1) { FactoryGirl.create(:like, likable: movie) }
  # given(:like2) { FactoryGirl.create(:like, likable: movie) }

  scenario 'Admin sees how many likes a review has'

end
