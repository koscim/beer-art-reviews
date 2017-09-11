require "rails_helper"

feature "as the user who posted a review I can update my review so that I can correct errors or provide new information" do
  scenario "current user updates existing review successfully" do

    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user)


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link review.art_label.name
    click_link 'Edit Review'

    choose("review_joy_5")
    choose("review_fear_5")
    choose("review_anger_5")

    click_button 'Update Review'

    expect(page).to have_content('Joy: 5 out of 5')
    expect(page).to have_content('Fear: 5 out of 5')
    expect(page).to have_content('Anger: 5 out of 5')
  end
end
