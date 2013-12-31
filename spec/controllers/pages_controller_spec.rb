require 'spec_helper.rb'

describe PagesController do
  describe "showing pages" do
    render_views

    it "shows the home page" do
      get :home
      expect(response.body).to match /Welcome/
    end

    it "shows the about page" do
      get :about
      expect(response.body).to match /About/
    end

    it "shows the support page" do
      get :support
      expect(response.body).to match /Support/
    end
  end
end
