require 'rails_helper'

feature 'admin deletes users', %Q{
  As an authorized admin
  I want to view a list of all of the users
  So that I can remove certain users
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authorized admin, I can see an Admin Section where I can
  #   view and delete users of my website.

  scenario 'as an admin I can delete certain users' do
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
    click_button "Delete #{user.username}"

    expect(page).to_not have_content(user.first_name)
    expect(page).to_not have_content(user.last_name)
    expect(page).to_not have_content(user.username)
  end
end
