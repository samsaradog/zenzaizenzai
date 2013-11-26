require 'spec_helper.rb'

describe PagesController do
  describe "showing pages" do
    render_views

    it "shows the home page" do
      get :home
      expect(response.body).to match /Welcome/
    end
  end
end
