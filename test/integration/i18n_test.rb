require 'test_helper'

class I18NTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "18ntest" do
    get root_url
    assert_select "h1", text: "サンプルappへようこそ"
    get help_path
    assert_select "h1", text: "ヘルプ"
    get contact_path
    assert_select "h1", text: "コンタクト"
    log_in_as (@user)
    get users_path
    assert_select "h1", text: "ユーザ一覧"
    delete logout_path
    follow_redirect!
    assert_select "h1", text: "サンプルappへようこそ"
  end
end
