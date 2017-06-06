require 'rails_helper'

describe StaticPagesController do
  describe 'コントローラテスト' do
    example "home" do
      get :home
      expect(response).to render_template :"static_pages/home"
    end
    
    example "help" do
      get :help
      expect(response).to render_template :"static_pages/help"
    end
    
    example "about" do
      get :about
      expect(response).to render_template :"static_pages/about"
    end

    example "contact" do
      get :contact
      expect(response).to render_template :"static_pages/contact"
    end

    example "help" do
      get :help
      expect(response).to render_template :"static_pages/help"
    end
  end
end