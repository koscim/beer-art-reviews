require 'rails_helper'

feature 'user signs up' , %Q{
    As a prospective user
    I want to create an account
    So that I can post items and review them
  } do

  # ACCEPTANCE CRITERIA
  # * I must specify a valid email address
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated

  scenario 'user specifies valid and required' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Barb'
    fill_in 'Last Name', with: 'Holland'
    fill_in 'Username', with: 'stuckintheupsidedown'
    fill_in 'Email', with: 'neverforget@swimmingpool.net'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! Please tell us how you feel.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'user does not supply required information' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Username can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Email is invalid")
    expect(page).to have_content("Password is too short (minimum is 6 characters)")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'anotherpassword'

    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Sign Out")
  end
end
