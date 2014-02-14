require 'spec_helper'

shared_examples "redirect unless admin" do
  context "user is not an admin" do
    it "redirects to the root page if the user is signed in" do
      user = Factory.create_user
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:authenticate_user!).and_return(true)
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
