require 'spec_helper'

describe 'add movies' do
  it 'valid submission must have a title, year and contributor id' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    page.should have_content('successfully created')
  end

  it 'does not submit if required fields are missing' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => ''
    fill_in 'Year', :with => ''
    fill_in 'Contributor', :with => ''
    click_button 'Enter'
    page.should have_content("can't be blank")
  end

  it 'creating a new movie directs user to movie show page' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end

  it 'creating a new movie adds to movies index' do
    visit root_path
    click_link 'Add a new movie'
    fill_in 'Title', :with => 'The Hangover Part III'
    fill_in 'Year', :with => '2013'
    fill_in 'Contributor', :with => '1'
    click_button 'Enter'
    visit root_path
    page.should have_content 'The Hangover Part III'
    page.should have_content '2013'
  end
end