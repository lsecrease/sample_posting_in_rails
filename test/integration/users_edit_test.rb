require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
 def setup
  @user = users(:lawrence)
 end
 
 test "unsuccessful edit" do
  log_in_as(@user)
  get edit_user_path(@user)
  assert_template 'user/edit'
  patch user_path(@ user), user: {name: "", email: "user@invalid", password: "foo", passowrd_confirmation: "bar"}
  assert_template 'users/edit'
 end
 
 test "successful edit with friendly forwarding" do
   get edit_user_path(@user)
   log_in_as(@user)
   assert_redirected_to edit_user_path
   patch user_path(@ user), user: {name: "Lawrence Bar", email: "user@valid.com", password: "", passowrd_confirmation: ""}
   assert_redirected_to @user
   assert_not flash.empty?
   @user.reload
   assert_equal @user.name, "Lawrence Bar"
   assert_equal @user.email, "user@valid.com"
 end
 
end
