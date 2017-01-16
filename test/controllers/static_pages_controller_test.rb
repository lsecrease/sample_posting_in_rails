require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/'
    assert_response :success
    assert_select "title", "Home | BookShout!"
  end

  test "should get help" do
    get '/help'
    assert_response :success
    assert_select "title", "Help | BookShout!"
  end

  test "should get about" do
    get '/about'
    assert_response :success
    assert_select "title", "About | BookShout!"
  end
 
 test "should get contact" do
    get '/contact'
    assert_response :success
    assert_select "title", "Contact | BookShout!"
  end
end
