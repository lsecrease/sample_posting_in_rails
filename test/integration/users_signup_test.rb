require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
 test "invalid signup info" do
  get signup_path
  assert_no_difference 'User.count' do
#  before_count = User.count
   post users_path, user: {name: "", email: "user@invalid", password: "foo", passowrd_confirmation: "bar"}
  end
   
#  after_count = User.count
#  assert_equal before_count, after_count
  assert_template 'users/new'
 end
 
  test "valid signup info" do
  get signup_path
  assert_difference 'User.count', 1 do
   post_via_redirect users_path, user: {name: "Sam", email: "user@valid.com", password: "password", passowrd_confirmation: "password"}
  end
  assert_template 'users/show'
  assert is_logged_in?
 end
 
 
end
