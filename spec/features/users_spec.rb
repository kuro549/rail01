require 'rails_helper'

feature 'General user' do
  background do
    @user = FactoryGirl.create(:user)
  end
    
  scenario "user login" do
    sign_in @user
    expect(page).to have_link('Log out', href: logout_path)
  end
  
  scenario "post micropost, delete micropost" do
    sign_in @user
    click_link 'Home'
    fill_in 'micropost[content]', with: "hello micropost"
    expect(page).to have_field 'micropost[content]', with: "hello micropost"
    click_button 'Post'
    expect(page).to have_content 'Micropost created!'
    click_link 'delete'
    expect(page).to have_content 'Micropost deleted'
  end
  
  scenario "my profile" do
    sign_in @user
    expect(page).to have_title @user.name
    expect(page).to have_selector 'h1', text: @user.name
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
end

feature 'Admin User' do
  background do
    @admin_user = FactoryGirl.create(:admin_user)
  end
  
  scenario "admin login" do
    sign_in @admin_user
    expect(page).to have_link('Log out', href: logout_path)
  end
  
  scenario "user delete" do
    
  end
  
end
