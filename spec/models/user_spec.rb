require 'rails_helper'

describe User do
    it 'is valid with name' do
        user = User.new(name: "TESTUSER", email: "testest@tetet.com", password: "password")
        expect(user).to be_valid
    end
    
    it 'is invalid with wrong email' do
        user = User.new(name: "TESTUSER", email: "testesttetet.com", password: "password")
        expect(user).not_to be_valid
    end
end