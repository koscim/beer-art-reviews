require 'rails_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that no one else can post items or reviews on my behalf
} do
  # ACCEPTANCE CRITERIA
  # * If I click the sign out button, I am signed out
  # * If I am not signed in, I don't see the sign out button

  scenario 'a signed in user signs out' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'
    expect(page).to have_content('Welcome Back!')
    expect(page).to have_content('Sign Out')

    click_link 'Sign Out'
    expect(page).to have_content("Ya'll come back now, ya hear!")
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end

  scenario 'an unauthenticated user does not see the sign out button' do
    visit root_path

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
  end
end
