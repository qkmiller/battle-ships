require 'rails_helper'

# describe "the add a list process" do
#   it "adds a new list" do
#     visit lists_path
#     click_link 'New List'
#     fill_in 'Name', :with => 'Home stuff'
#     click_on 'Create List'
#     expect(page).to have_content 'Lists'
#   end
#
#   it "gives error when no name is entered" do
#     visit new_list_path
#     click_on 'Create List'
#     expect(page).to have_content 'errors'
#   end
# end
#
# describe "the edit a task process" do
#   it "edits a task" do
#     list = List.create(:name => 'Home stuff')
#     task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
#     visit list_path(list)
#     click_on 'Edit'
#     fill_in 'Description', :with => 'Wash the dog'
#     click_on 'Update Task'
#     expect(page).to have_content 'Wash the dog'
#   end
#
#   it "gives error when no description is entered" do
#     list = List.create(:name => 'Home stuff')
#     task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
#     visit list_path(list)
#     click_on 'Edit'
#     fill_in 'Description', :with => ''
#     click_button 'Update Task'
#     expect(page).to have_content 'errors'
#   end
# end


# Your goal should be to write an integration test for every path through your app
