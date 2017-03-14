require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

 def setup
  @admin = users(:lawrence)
  @non-admin = users(:archer)
 end
 
 test "index as admin including pagination and delete links" do
  log_in_as(@admin)
  get users_path
  assert_template 'users/index'
  assert select 'div.pagination'
  first_page_of_users = User.pagination(page: 1)
  first_page_of_users.each do |user|
   assert_select 'a[href=?]' user_path(user), text: user.name
   unless user == @admin
     assert_select 'a[href=?]' user_path(user), text: 'delete', method: :delete
  end
  end
  assert_difference 'User.count', -1 do
   delete user_path(@non_admin)
  end
 end
 
 
 test "index as non-admin" do
  log_in_as(@non-admin)
  get users_path
  assert_select 'a', text: 'delete', count: 0
 end
 
end
 