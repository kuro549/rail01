require 'rails_helper'

feature '一般ユーザのフィーチャテスト' do
  background do
    @user = FactoryGirl.create(:user)
  end
    
  scenario "ログインをする(一般ユーザ)" do
    sign_in @user
    expect(page).to have_link('ログアウト', href: logout_path)
  end
  
  scenario "micropostを投稿し、削除する(一般ユーザ)" do
    sign_in @user
    click_link 'ホーム'
    fill_in 'micropost[content]', with: "hello micropost"
    expect(page).to have_field 'micropost[content]', with: "hello micropost"
    click_button '送信'
    expect(page).to have_content 'Micropostを作成しました'
    click_link 'delete'
    expect(page).to have_content 'Micropostを削除しました'
  end
  
  scenario "プロファイルを表示する(一般ユーザ)" do
    sign_in @user
    expect(page).to have_title @user.name
    expect(page).to have_selector 'h1', text: @user.name
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
  
  scenario "ログアウトする(一般ユーザ)" do
    sign_in @user
    sign_out
    expect(page).to have_link('ログイン', href: login_path)
  end
  
end

feature '特権ユーザのフィーチャテスト' do
  background do
    @user = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:admin_user)
    30.times { FactoryGirl.create(:ramdom_user) }
  end
  
  scenario "ログインする(特権ユーザ)" do
    sign_in @admin_user
    expect(page).to have_link('ログアウト', href: logout_path)
  end
  
  scenario "ユーザを削除する(特権ユーザ)" do
    sign_in @admin_user
    click_link 'ユーザ一覧'
    
    before = User.count
    click_link 'delete', match: :first
    after = User.count
    expect(before - after).to eq 1
  end
  
  scenario "プロファイルを表示する(特権ユーザ)" do
    sign_in @admin_user
    expect(page).to have_title @admin_user.name
    expect(page).to have_selector 'h1', text: @admin_user.name
    @admin_user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
  
  scenario "ログアウトする(特権ユーザ)" do
    sign_in @admin_user
    sign_out
    expect(page).to have_link('ログイン', href: login_path)
  end
  
end
