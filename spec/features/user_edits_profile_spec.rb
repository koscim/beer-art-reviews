require 'rails_helper'

feature 'user signs in', %Q{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authenticated user, I can update my information
  #   by clicking an edit profile link that will bring me to an edit page.
  # * If I click the update button on the edit page, my information
  #   will be saved.
  # * If I edit my password, the new password is saved.
  # * If I edit my password and the confirmation password does not match,
  #   the new password is not saved.

  scenario 'an existing user visits the edit user profile page' do
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
  end

  scenario 'an existing user clicks the update button on the edit user profile page' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link 'Edit Profile'
    fill_in 'First Name', with: 'Steve'
    fill_in 'Last Name', with: 'Scuba'
    fill_in 'Username', with: 'scuba_steve'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('(?) Beer Art Reviews will remember that.')

    click_link 'Edit Profile'

    expect(page).to have_content('Edit User Profile')
    expect(page).to have_field('First Name', with: 'Steve')
    expect(page).to have_field('Last Name', with: 'Scuba')
    expect(page).to have_field('Username', with: 'scuba_steve')
    expect(page).to have_field('Email', with: user.email)
  end

  scenario 'user edits a password successfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link 'Edit Profile'
    fill_in 'First Name', with: 'Steve'
    fill_in 'Last Name', with: 'Scuba'
    fill_in 'Username', with: 'scuba_steve'
    fill_in 'Password', with: 'ilovewater'
    fill_in 'Password confirmation', with: 'ilovewater'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content('(?) Beer Art Reviews will remember that.')

    click_link 'Sign Out'
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'ilovewater'

    click_button 'Sign In'

    expect(page).to have_content('Welcome Back!')
  end

  scenario 'user edits a password unsuccessfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link 'Edit Profile'
    fill_in 'First Name', with: 'Steve'
    fill_in 'Last Name', with: 'Scuba'
    fill_in 'Username', with: 'scuba_steve'
    fill_in 'Password', with: 'ilovewater'
    fill_in 'Password confirmation', with: 'iloveocean'
    fill_in 'Current password', with: 'password'

    click_button 'Update'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
