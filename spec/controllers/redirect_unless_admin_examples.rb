require 'spec_helper'

shared_examples "redirect unless admin" do
  context "user is not an admin" do
    it "redirects to the root page if the user is signed in" do
      user = Factory.create_user
      controller.stub(:current_user).and_return(user)
      controller.stub(:authenticate_user!).and_return(true)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
