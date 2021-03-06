require 'rails_helper'

RSpec.feature "Timeline", type: :feature do

  scenario "User can delete is own posts" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"
    click_link 'Hello'
    click_link 'Delete'
    expect(page).to have_content('Welcome test')
    expect(page).not_to have_content('Hello')
  end

  scenario "User cannot delete other's posts" do
    visit '/users/new'
    fill_in 'user_name',      with: 'test'
    fill_in 'user_email',     with: 'test@test.com'
    fill_in 'user_password',  with: 'testey'
    click_button 'Create my account'
    click_link "New post"
    fill_in "Message", with: "Hello"
    click_button "Submit"

    visit '/users/new'
    fill_in 'user_name',      with: 'test2'
    fill_in 'user_email',     with: '2test@test.com'
    fill_in 'user_password',  with: '2testey'
    click_button 'Create my account'
    click_link 'All Posts'
    click_link 'Hello'
    click_link 'Delete'
    expect(page).to have_content("Error: you can\'t delete other users messages")
    expect(page).to have_content('Hello')
  end
end