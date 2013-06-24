require 'spec_helper'

feature 'User updates account details', %{
  As a logged in User
  I want to be able to update my account details
  so I can manage my presence on the website 
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
    page.should have_content('Signed')
  end

  scenario "User sees an 'Update Account' link when logged in" do
    visit root_path
    click_link 'Update account'
    expect(page).to have_content("Edit User")
  end

  scenario "User sees a form that requires they enter their current password" do
    visit root_path
    click_link 'Update account'
    fill_in 'Email', :with => 'email1@example.com'
    fill_in 'Password', :with => 'password1'
    fill_in 'Password confirmation', :with => 'password1'
    fill_in 'Current password', :with => ''
    click_button 'Update'
    expect(page).to have_content("Please review the problems below:")
  end

  scenario "User sees a form that optionally allows them to select a new email address" do
    visit root_path
    click_link 'Update account'
    fill_in 'Email', :with => 'email2@example.com'
    fill_in 'Current password', :with => 'password'
    click_button 'Update'
    expect(page).to have_content("You updated your account successfully, but we need to verify your new email address.")
  end

  scenario "User sees a form that optionally allows them to select a new password" do
    visit root_path
    click_link 'Update account'
    fill_in 'Email', :with => 'email1@example.com'
    fill_in 'Current password', :with => 'password'
    click_button 'Update'
    expect(page).to have_content("You updated your account successfully")
  end

  scenario "User is required to confirm their new password if they have entered a new password" do
    visit root_path
    click_link 'Update account'
    fill_in 'Password', :with => 'password1'
    fill_in 'Password confirmation', :with => ''
    fill_in 'Current password', :with => 'password'
    click_button 'Update'
    expect(page).to have_content("Please review the problems below:")
  end
end