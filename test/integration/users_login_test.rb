require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    
    post login_path, params: {session: {email:"",password:""}} #エラーになるはず
    assert_template 'sessions/new'
    assert_not flash.empty? #フラッシュされてるはずだよね？
    
    get root_path
    assert flash.empty? #フラッシュはなくなってるはずだよね？
  end
end
