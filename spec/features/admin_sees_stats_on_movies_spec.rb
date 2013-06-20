require 'spec_helper'
include Warden::Test::Helpers

feature 'Admin sees stats on movies', %{
  As an Administrator
  I should be able to see stats about each movie
  So I can see the most popular movies
  } do

  given(:admin) { FactoryGirl.create(:admin) }

  scenario 'Guest cannot see movie stats'

  scenario 'User cannot see movie stats unless they are an admin'

  scenario 'Admin sees how many reviews a movie has'

  scenario 'Admin sees how many likes a movie has'

  scenario 'Admin sees how many pageviews a movie has'

end
