require 'rails_helper'

# As an admin
# I want update a user's admin rights
# So they can become an admin or a member

feature "admin updates user admin rights" do
  scenario "admin successfully updates user role from member to admin" do
    admin = FactoryGirl.create(:user, role: 'admin')
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Sign In'

    click_link 'Admin Section'

    click_button "Promote #{user.username}"

    expect(page).to have_content('User Successfully Given Admin Rights!')
  end

  scenario "admin successfully updates user role from admin to member" do
    admin_1 = FactoryGirl.create(:user, role: 'admin')
    admin_2 = FactoryGirl.create(:user, role: 'admin')

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: admin_1.email
    fill_in 'Password', with: admin_1.password

    click_button 'Sign In'

    click_link 'Admin Section'

    click_button "Demote #{admin_2.username}"

    expect(page).to have_content('User Successfully Demoted!')
  end
end
