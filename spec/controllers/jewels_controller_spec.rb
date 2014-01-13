require 'spec_helper.rb'
require 'controllers/redirect_unless_admin_examples'

describe JewelsController do
  it_behaves_like "redirect unless admin"

  context "user is an admin" do
    before do
      @user = Factory.create_user({:is_admin => true})
      controller.stub(:current_user).and_return(@user)
      controller.stub(:authenticate_user!).and_return(true)
      @jewel = Factory.create_jewel
    end

    context "#index" do
      it "index retrieves a list of jewels" do
        get :index, :format => "json"
        expect(JSON.parse(response.body)["aaData"]).to eq([["abc", "def", "ghi", "jkl", "<a href=\"/jewels/#{@jewel.id}/edit\">Edit</a>"]])
      end

      it "retrieves a jewel with a search parameter" do
        new_jewel = Factory.create_jewel({:source => "xyz"})
        get :index, :format => "json", :sSearch => "xyz"
        expect(JSON.parse(response.body)["aaData"]).to eq([["xyz", "def", "ghi", "jkl", "<a href=\"/jewels/#{new_jewel.id}/edit\">Edit</a>"]])
      end
    end

    it "edit retrieves a jewel" do
      get :edit, :id => @jewel.id
      expect(assigns(:jewel)).to eq(@jewel)
    end

    context "#update" do
      it "updates a jewel" do
        put :update, :id => @jewel.id, :jewel => {:source => "new"}
        expect(@jewel.reload.source).to eq("new")
        expect(response).to redirect_to(jewels_path)
      end

      it "redirects to the edit page if edit not successful" do
        Jewel.stub(:find).and_return(@jewel)
        @jewel.stub(:update_attributes).and_return(false)
        put :update, :id => @jewel.id, :jewel => {:source => "new"}

        expect(response).to redirect_to(edit_jewel_path(@jewel.id))
      end
    end

  end

end
