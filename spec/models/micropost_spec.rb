require 'rails_helper'


describe "Micropostモデルテスト" do
   it "正当なユーザに関連づけられたマイクロポストが作成できること" do
       @user = User.new(name: 'Michael Example', 
       email: 'michael@example2.com', 
       password_digest: User.digest('password'), 
       admin: false)
       @user.save
       @micropost = @user.microposts.build(content: "Lorem ipsum")
       expect(@micropost).to be_valid
    end
   it "ユーザに関連づけられないマイクロポストは作成できないこと" do
       @user = User.new(name: 'Michael Example', 
       email: 'michael@example2.com', 
       password_digest: User.digest('password'), 
       admin: false)
       @user.save
       @micropost = @user.microposts.build(content: "Lorem ipsum")
       @micropost.user_id = nil
       expect(@micropost).not_to be_valid
   end
   
   it "空白のマイクロポストは作成できないこと" do
     @user = User.new(name: 'Michael Example', 
     email: 'michael@example2.com', 
     password_digest: User.digest('password'), 
     admin: false)
     @micropost = @user.microposts.build(content: "      ")
     expect(@micropost).not_to be_valid
   end
   
   it "長すぎる(141文字以上の)マイクロポストは作成できないこと" do
     @user = User.new(name: 'Michael Example', 
     email: 'michael@example2.com', 
     password_digest: User.digest('password'), 
     admin: false)
     @micropost = @user.microposts.build(content: "a" * 141)
     expect(@micropost).not_to be_valid
   end
end
