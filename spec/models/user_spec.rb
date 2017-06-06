require 'rails_helper'

describe User do
    before do
      @user = FactoryGirl.build(:user)
    end
    
    it 'is valid with valid user' do
        expect(FactoryGirl.build(:user)).to be_valid
    end
    
    it 'is invalid with nopresent' do
        expect(FactoryGirl.build(:user, name: "   ")).not_to be_valid
    end
    
    it 'is invalid with duplicate address' do
        FactoryGirl.create(:user, email: 'aabbcc@example.com')
        dupuser = FactoryGirl.build(:user, name: "dupuser", email: 'aabbcc@example.com')
        expect(dupuser).not_to be_valid
    end
    
    it 'is saved as lower-case (email)' do
        user = FactoryGirl.create(:user, email: 'AABBCC@example.com')
        expect(user.email).to eq 'aabbcc@example.com'
    end
    
    it 'is invalid with blank password' do
        user = FactoryGirl.build(:user, password: ' ' * 6)
        expect(user).not_to be_valid
    end
    
    it 'is invalid with short password' do
        user = FactoryGirl.build(:user, password: 'a' * 5)
        expect(user).not_to be_valid
    end
    
    example 'ユーザを削除した時、関連のマイクロポストの削除される' do
        user = FactoryGirl.create(:user)
        user.microposts.create!(content: "Lorem ipsum")
        beforecount = Micropost.count
        user.destroy
        aftercount = Micropost.count
        expect(beforecount - aftercount).to eq 1
    end
    
    example 'ユーザをフォローおよびアンフォローできること' do
        
    end
    
    example 'feed should have the right posts' do
        
    end
    

=begin  
  test "should follow and unfollow a user" do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    assert michael.following?(archer)
    assert archer.followers.include?(michael)
    michael.unfollow(archer)
    assert_not michael.following?(archer)
  end
  
  test "feed should have the right posts" do
    michael = users(:michael)
    archer  = users(:archer)
    lana    = users(:lana)
    # フォローしているユーザーの投稿を確認
    lana.microposts.each do |post_following|
      assert michael.feed.include?(post_following)
    end
    # 自分の投稿を確認
    michael.microposts.each do |post_self|
      assert michael.feed.include?(post_self)
    end
    # フォローしていないユーザーの投稿を確認
    archer.microposts.each do |post_unfollowed|
      assert_not michael.feed.include?(post_unfollowed)
    end
=end
end