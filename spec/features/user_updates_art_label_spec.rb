require "rails_helper"

feature "as an authenticated user I want to update an art label so that I can correct errors or provide new information" do
  pending "authenticated user updates existing art label successfully" do

    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link 'Add New Art Label'

    fill_in 'Name', with: "Racer 5 India Pale Ale, Bear Republic Brew"
    page.attach_file('art_label[label_photo]', Rails.root + 'spec/support/beers/logos/mdqdt.jpg')
    fill_in 'Brewery', with: "Tsathoggua"
    fill_in 'Beer style', with: "IPA"
    fill_in 'Art style', with: "Art Deco"
    fill_in 'Container type', with: "Tall Boy"
    fill_in 'Beer description', with: "Robust flavor"
    fill_in 'Art description', with: "Art Deco"
    fill_in 'Beer rating', with: "4"

    click_button "Add Art Label"

    click_link "Edit Art Label"

    fill_in 'Container type', with: "Growler"

    click_button "Submit Edited Racer 5 India Pale Ale, Bear Republic Brew"

    expect(page).to have_content "Art Label Successfully Updated!"
    expect(page).to have_content "Growler"
  end

  pending "authenticated user does not provide proper information to update an art label" do

    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    click_link 'Add New Art Label'

    fill_in 'Name', with: "Racer 5 India Pale Ale, Bear Republic Brew"
    page.attach_file('art_label[label_photo]', Rails.root + 'spec/support/beers/logos/mdqdt.jpg')
    fill_in 'Brewery', with: "Tsathoggua"
    fill_in 'Beer style', with: "IPA"
    fill_in 'Art style', with: "Art Deco"
    fill_in 'Container type', with: "Tall Boy"
    fill_in 'Beer description', with: "Robust flavor"
    fill_in 'Art description', with: "Art Deco"
    fill_in 'Beer rating', with: "4"

    click_button "Add Art Label"

    click_link "Edit Art Label"

    fill_in 'Name', with: ""
    fill_in 'Brewery', with: ""

    click_button "Submit Edited Racer 5 India Pale Ale, Bear Republic Brew"

    expect(page).to have_content "Brewery can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end
