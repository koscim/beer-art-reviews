require 'rails_helper'

feature 'user deletes their created review', %Q{
  As an authorized user
  I want to view my review for a given art label
  So that I can remove that review
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authorized user, I can see a delete button for my review
  #   Delete button deletes the user's review if and
  #   only if the user created the review

  pending 'authorized user can delete their review' do
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user)
    art_label = review.art_label
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_link review.art_label.name
    expect(page).to have_content(art_label.name)
    expect(page).to have_content(review.feels)

    click_button 'Delete'

    expect(page).to have_content(art_label.name)
    expect(page).to_not have_content(review.feels)
  end
end
