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

  scenario 'user updates a review uncessfully' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user)


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link review.art_label.name
    click_link 'Edit Review'

    fill_in 'Feels', with: ''

    click_button 'Update Review'

    expect(page).to have_content("Edit #{user.username}\'s Review")
    expect(page).to have_content('Feels can\'t be blank')
  end

  scenario 'user who is not author of review fails to update review' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    art_label = review.art_label

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit edit_art_label_review_path(art_label, review)

    fill_in 'Feels', with: ''

    click_button 'Update Review'


    expect(page).to have_content("Invalid user. You didn't create this!")
    expect(page).to have_content(art_label.name)
  end
end
