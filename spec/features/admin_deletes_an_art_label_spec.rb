require 'rails_helper'

feature 'admin deletes art label', %Q{
  As an authorized admin
  I want to view a list all art labels
  So that I can remove certain art labels
} do

  # ACCEPTANCE CRITERIA
  # * If I am an authorized admin, I can see a delete button on my index
  #   art label page that I can use to delete an art label.

  pending 'as an admin I can delete certain art labels' do
    admin = FactoryGirl.create(:user, role: 'admin')
    art_label = FactoryGirl.create(:art_label)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign In'

    expect(page).to have_content(art_label.name)

    click_button 'Delete'

    expect(page).to_not have_content(art_label.name)
  end
end
