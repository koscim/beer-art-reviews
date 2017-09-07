require 'rails_helper'

feature 'admin views users', %Q{
  As an authorized admin
  I want to view a list of all of the users
  So that I can administrate
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authorized admin, I can see an Admin Section where I can
  #   view all of the users of my website.
  # * If I am not an authorized admin, I cannot see the Admin Section.

  scenario 'an existing admin signs in and sees the Admin Section' do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to have_content('Admin Section')

    click_link 'Admin Section'
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.username)
  end

  scenario 'an unauthorized user signs in and does not see the Admin Section' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')
    expect(page).to_not have_content('Admin Section')
  end
end
