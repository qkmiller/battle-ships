require 'rails_helper'

describe "the signup process", type: :feature do
  it "signs me up" do
    visit "/"
    click_link 'Sign Up'
    fill_in 'Username', :with => 'usertwo'
    fill_in 'Password', :with => 'password'
    click_on 'Create User'
    expect(page).to have_content 'usertwo'
  end
end

describe "the login process", type: :feature do
  before :each do
    User.create(username: 'userone', password: 'password')
  end

  it "logs me in" do
    visit "/"
    click_link 'Log In'
    fill_in 'Username', :with => 'userone'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    expect(page).to have_content 'Logged in as userone. Logout'
  end
end

# describe "new game process", type: :feature do
#   before :each do
#     User.create(username: 'userone', password: 'password')
#   end
#
#   it "logs me in and starts a new game" do
#     visit "/"
#     click_link 'Log In'
#     fill_in 'Username', :with => 'userone'
#     fill_in 'Password', :with => 'password'
#     click_on 'Login'
#     click_on 'New game'
#     expect(page).to have_content 'PLAYER 1 place your ships:'
#   end
# end
#
# describe "plays a new game process", type: :feature do
#   before :each do
#     User.create(username: 'userone', password: 'password')
#   end
#   it "logs me in and starts a new game" do
#     visit "/"
#     click_link 'Log In'
#     fill_in 'Username', :with => 'userone'
#     fill_in 'Password', :with => 'password'
#     click_on 'Login'
#     click_on 'New game'
#     click_on ""
#     click_on ""
#     click_on ""
#     click_on ""
#     click_on ""
#     click_on ""
#     click_on ""
#     click_on 'Start'
#     expect(page).to have_content "PLAYER 2's Ocean"
#   end
# end


describe "Logout process", type: :feature do
  before :each do
    User.create(username: 'userone', password: 'password')
  end

  it "logs the user out" do
    visit "/"
    click_link 'Log In'
    fill_in 'Username', :with => 'userone'
    fill_in 'Password', :with => 'password'
    click_on 'Login'
    click_on 'Logout'
    expect(page).to have_content 'Please log in or sign up to play battlship, if you dare...'
  end
end
#
# RSpec.describe "cells/index.html.erb", type: :view do
#   before :each do
#     User.create(username: 'userone', password: 'password')
#     visit "/"
#     click_link 'Log In'
#     fill_in 'Username', :with => 'userone'
#     fill_in 'Password', :with => 'password'
#     click_on 'Login'
#   end
#   it "displays the two player's board" do
#     assign :todo, Game.new(:player_1_name => 'Rob', :player_2_name => 'Kate')
#     render
#     expect(rendered).to have_css("header h4", text: "PLAYER 2's Ocean")
#   end
# end
