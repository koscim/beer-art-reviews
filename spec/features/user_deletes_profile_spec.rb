require 'rails_helper'

feature 'user deletes account', %Q{
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authenticated user, I can update my information
  #   by clicking an edit profile link that will bring me to an edit page
  #   with an option to cancel my account.
  # * If I click "cancel my account" on the edit page, my account
  #   will be deleted.

  scenario 'an existing user visits the edit user profile page and sees a "cancel my account" button' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    expect(page).to have_content('Edit User Profile')
    expect(page).to have_field('First Name', with: user.first_name)
    expect(page).to have_field('Last Name', with: user.last_name)
    expect(page).to have_field('Username', with: user.username)
    expect(page).to have_field('Email', with: user.email)
    expect(page).to have_content('Cancel my account')
  end

  scenario 'an existing user clicks the "cancel my account" button and their account is deleted' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Edit Profile')

    click_link 'Edit Profile'
    expect(page).to have_content('Edit User Profile')
    expect(page).to have_field('First Name', with: user.first_name)
    expect(page).to have_field('Last Name', with: user.last_name)
    expect(page).to have_field('Username', with: user.username)
    expect(page).to have_field('Email', with: user.email)
    expect(page).to have_content('Cancel my account')

    click_button 'Cancel my account'

    expect(page).to have_content(":( You're leaving us? Okay... I guess we'll just destroy your account... right now... Please come back soon!")
  end
end
