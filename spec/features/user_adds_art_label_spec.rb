require "rails_helper"

feature "users can add art label" do
  pending "visitor adds new art label successfully" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit new_art_label_path
    expect(page).to have_content "New Art Label!"

    fill_in 'Name', with: "Racer 5 India Pale Ale, Bear Republic Brew"
    fill_in 'Image', with: "https://pigment.github.io/fake-logos/logos/medium/color/8.png"
    fill_in 'Brewery', with: "Tsathoggua"
    fill_in 'Beer style', with: "IPA"
    fill_in 'Art style', with: "Art Deco"
    fill_in 'Container type', with: "Tall Boy"
    fill_in 'Beer description', with: "Robust flavor"
    fill_in 'Art description', with: "Art Deco"
    fill_in 'Beer rating', with: "4"

    click_button "Add Art Label"

    expect(page).to have_content "Art Label Successfully Posted!"
    expect(page).to have_content "Racer 5 India Pale Ale, Bear Republic Brew"
    expect(page).to have_content "Robust flavor"
  end

  pending "visitor does not provide proper information for an art label" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    visit new_art_label_path

    click_button "Add Art Label"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Image url can't be blank"
    expect(page).to have_content "Brewery can't be blank"

  end
end
