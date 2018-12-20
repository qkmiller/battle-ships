require 'rails_helper'

# describe User, type: :model do
  describe "the signup process", type: :feature do
    before :each do
      User.create(username: 'userone', password: 'password')
    end

    it "signs me up" do
      visit "/"
      click_link 'Sign Up'
      fill_in 'Username', :with => 'usertwo'
      fill_in 'Password', :with => 'password'
      click_on 'Create User'
      expect(page).to have_content 'usertwo'
    end

    it "signs me in" do
      visit new_user_path
      expect(page).to have_content 'Sign Up'
    end
  end
# end
