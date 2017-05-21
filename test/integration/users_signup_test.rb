require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params:{user:{name:"",email:"user@invalid",password:"foo",password_confirmation:"bar"}}
    end
    assert_template 'users/new'
  end
  
    test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params:{user:{name:"EXAMPLE",email:"user@valid.com",password:"foobar",password_confirmation:"foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.nil?
    assert is_logged_in?
  end
    
  test "invalid signup information original"do
      get signup_path
      post signup_path, params:{user:{name:"",email:"testes@hotmail.com", password:"footars",password_confirmation:"footars"}}
      assert_select ".form-control"
      end
end
