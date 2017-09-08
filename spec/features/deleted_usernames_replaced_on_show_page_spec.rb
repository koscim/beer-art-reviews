require 'rails_helper'

feature "creator of art_label is visible on page, if user no longer exists, name is replaced with message" do
  scenario "art_label was created by current member of site" do

    art_label = FactoryGirl.create(:art_label)
    user = art_label.user
    visit art_label_path(art_label)

    expect(page).to have_content user.username

  end

  scenario "art_label was created by member who has since quit site" do

    art_label = FactoryGirl.create(:art_label)
    user = art_label.user
    user.delete

    visit art_label_path(art_label)
    expect(page).to have_content "User no longer exists"

  end
end
