require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "Can submit posts and view them" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"
    click_link 'Hello'
    expect(page).to have_content("Hello - #{Date.today.to_s}")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")
  end
end