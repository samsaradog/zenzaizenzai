require 'spec_helper.rb'

describe JewelsController do
  context "user is not an admin" do
    it "redirects to the root page if the user is signed in" do
      user = Factory.create_user
      controller.stub(:current_user).and_return(user)
      controller.stub(:authenticate_user!).and_return(true)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end

  context "user is an admin" do
    before do
      @user = Factory.create_user({:is_admin => true})
      controller.stub(:current_user).and_return(@user)
      controller.stub(:authenticate_user!).and_return(true)
      @jewel = Factory.create_jewel
    end

    it "index retrieves a list of jewels" do
      get :index
      expect(assigns(:jewels)).to eq([@jewel])
    end
  end
end
