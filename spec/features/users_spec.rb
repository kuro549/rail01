require 'rails_helper'

feature 'General user' do
  background do
    @user = FactoryGirl.create(:user)
  end
    
  scenario "user login" do
    sign_in @user
    expect(page).to have_link('Log out', href: logout_path)
  end
  
  scenario "post micropost" do
    sign_in @user
    click_link 'Home'
    fill_in 'micropost[content]', with: "hello micropost"
    expect(page).to have_field 'micropost[content]', with: "hello micropost"
    click_button 'Post'
    expect(page).to have_content 'Micropost created!'
  end
end

feature 'Admin User' do
  
end
