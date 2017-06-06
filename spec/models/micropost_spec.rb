require 'rails_helper'

describe Micropost do
   it "is valid micropost with valid user" do
       @user = User.new(name: 'Michael Example', 
       email: 'michael@example2.com', 
       password_digest: User.digest('password'), 
       admin: true)
       @user.save
       @micropost = @user.microposts.build(content: "Lorem ipsum")
       expect(@micropost).to be_valid
    end
   it "is invalid micropost with no user" do
       @user = User.new(name: 'Michael Example', 
       email: 'michael@example2.com', 
       password_digest: User.digest('password'), 
       admin: true)
       @user.save
       @micropost = @user.microposts.build(content: "Lorem ipsum")
       @micropost.user_id = nil
       expect(@micropost).not_to be_valid
   end
   
   it "is invalid micropost with invalid content"
   
   it "is invalid micropost with content(141characters)"
   
   it "is valid micropost most recent first"
    
end
