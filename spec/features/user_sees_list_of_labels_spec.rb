require 'rails_helper'

feature 'user sees list of all labels', %Q{
  As an authenticated user
  I want to view a list of items
  So that I can pick items to review
} do
  scenario 'user visits index page' do

    art_label_1 = FactoryGirl.create(:art_label)
    art_label_2 = FactoryGirl.create(:art_label)

    visit root_path

    expect(page).to have_content(art_label_1.name)
    expect(page).to have_content(art_label_2.name)
    expect(page).to have_link(art_label_1.name)
    expect(page).to have_link(art_label_2.name)
  end
end
