require 'rails_helper'

feature 'admin deletes reviews', %Q{
  As an authorized admin
  I want to view a list all reviews for a given art label
  So that I can remove certain reviews
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authorized admin, I can see a delete button on my art
  #   labels show page where I can delete reviews for art labels.

  pending 'as an admin I can delete certain reviews' do
    admin = FactoryGirl.create(:user, role: 'admin')
    review = FactoryGirl.create(:review)
    art_label = review.art_label
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    click_link review.art_label.name
    expect(page).to have_content(art_label.name)
    expect(page).to have_content(review.feels)

    click_button 'Delete'

    expect(page).to_not have_content(review.feels)
  end
end
