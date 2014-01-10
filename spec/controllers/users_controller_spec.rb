require 'spec_helper'
require 'controllers/redirect_unless_admin_examples'

describe UsersController do
  it_behaves_like "redirect unless admin"

  context "user is an admin" do
    context "#index" do
      before do
        @user = Factory.create_user({:is_admin => true})
        controller.stub(:current_user).and_return(@user)
        controller.stub(:authenticate_user!).and_return(true)
      end

      it "returns a list of users" do
        get :index

        expect(assigns(:users)).to eq([@user])
      end
    end
  end
end
