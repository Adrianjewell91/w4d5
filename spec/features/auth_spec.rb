require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'email', with: 'adriantheman'
      fill_in 'password', with: '123456'
      # save_and_open_page
      # click_on 'Sign Up'
      # byebug
    end

    scenario 'redirects to #show index page after signing up' do
      # click_on "Sign Up"
      # byebug
      expect(page).to have_content "Welcome"
    end
  end

  feature 'with an invalid user' do

    scenario 're-renders the signup page after failed sign-up'
  end

end
