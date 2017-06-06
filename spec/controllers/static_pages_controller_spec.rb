require 'rails_helper'

describe StaticPagesController do
  describe 'GET #help' do
    example "check signup" do
      get :help
      expect(response).to render_template :"static_pages/help"
    end
  end
end