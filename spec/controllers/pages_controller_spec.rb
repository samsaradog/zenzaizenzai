require 'spec_helper.rb'

describe PagesController do
  describe "showing pages" do
    render_views

    context "home page" do
      before do
        Factory.create_jewel
        get :home
      end

      it "shows the home page" do
        expect(response.body).to match /Welcome/
      end

      it "retrieves a jewel" do
        expect(assigns(:jewel)).to be_a(Jewel)
      end
    end

    it "shows the about page" do
      get :about
      expect(response.body).to match /About/
    end

    it "shows the support page" do
      get :support
      expect(response.body).to match /Support/
    end

    it "shows the zenzai page" do
      get :zenzai
      expect(response.body).to match /zenzai/i
    end
  end
end
