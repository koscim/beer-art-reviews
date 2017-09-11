require 'rails_helper'

# As an authenticated user
# I want to add a review
# So that others can see it

feature "authenticated user adds a review" do
  scenario "and existing user fills in form on page of label they want to review" do
    art_label = FactoryGirl.create(:art_label)
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link art_label.name

    fill_in 'Feels', with: "I liked it ok."

    select "Buzzed", :from => "review_intoxication_level"

    choose("review_joy_1")

    click_button "Submit Review"

    expect(page).to have_content("Feels: I liked it ok.")
    expect(page).to have_content("Joy: 1 out of 5")
    expect(page).to have_content("Username: #{user.username}")

  end

  scenario "unauthenticated user attempts to write a review that fails" do
    art_label = FactoryGirl.create(:art_label)

    visit art_label_path(art_label)

    fill_in 'Feels', with: "I liked it ok."

    select "Buzzed", :from => "review_intoxication_level"

    choose("review_joy_1")

    click_button "Submit Review"

    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario "authenticated user attempts to write a review without all required information and fails" do

    art_label = FactoryGirl.create(:art_label)
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit art_label_path(art_label)
    click_button "Submit Review"

    expect(page).to have_content("Feels can't be blank")
  end
end
