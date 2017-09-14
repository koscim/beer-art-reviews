require 'rails_helper'

feature 'email is sent to art label owner for new review', %Q{
  As the owner of an art label
  I want to receive an email when someone submits a review for my art label
  So I can stay in the know
} do

  # ACCEPTANCE CRITERIA
  # * A notification email is sento to the owner
  #   of an art label when a new review
  #   is submitted

  scenario 'Email notification successfully sent to art label owner' do
    art_label = FactoryGirl.create(:art_label)
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit new_art_label_review_path(art_label)

    fill_in "Feels", with: "Total garbage."
    click_button "Submit Review"
    
    review = Review.find_by(feels: "Total garbage.")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
