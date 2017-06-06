require 'rails_helper'

describe "Userモデルテスト" do
  before do
    @user = FactoryGirl.build(:user)
  end
  
  it 'ユーザの各パラメータが不正でないこと' do
      expect(FactoryGirl.build(:user)).to be_valid
  end
  
  it 'ユーザ名が空欄でないこと' do
      expect(FactoryGirl.build(:user, name: "   ")).not_to be_valid
  end
  
  it 'ユーザのメールアドレスに重複がないこと' do
      FactoryGirl.create(:user, email: 'aabbcc@example.com')
      dupuser = FactoryGirl.build(:user, name: "dupuser", email: 'aabbcc@example.com')
      expect(dupuser).not_to be_valid
  end
  
  it 'メールアドレスは小文字で保存されること' do
      user = FactoryGirl.create(:user, email: 'AABBCC@example.com')
      expect(user.email).to eq 'aabbcc@example.com'
  end
  
  it '空欄のパスワードは認めないこと' do
      user = FactoryGirl.build(:user, password: ' ' * 6)
      expect(user).not_to be_valid
  end
  
  it '短い(6文字未満)のパスワードは認めないこと' do
      user = FactoryGirl.build(:user, password: 'a' * 5)
      expect(user).not_to be_valid
  end
  
  example 'ユーザを削除した時、関連のマイクロポストの削除されること' do
      user = FactoryGirl.create(:user)
      user.microposts.create!(content: "Lorem ipsum")
      beforecount = Micropost.count
      user.destroy
      aftercount = Micropost.count
      expect(beforecount - aftercount).to eq 1
  end
end