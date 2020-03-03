require 'spec_helper'
require 'controllers/redirect_unless_admin_examples'

describe UsersController, type: :controller do
  it_behaves_like "redirect unless admin"

  context "user is an admin" do
    before do
      @user = Factory.create_user({:is_admin => true, :gets_daily_dharma => true})
      allow(controller).to receive(:current_user).and_return(@user)
      allow(controller).to receive(:authenticate_user!).and_return(true)
    end

    it "index retrieves a list of users" do
      get :index, params: { format: "json" }
      expect(JSON.parse(response.body)["aaData"]).to eq([["abc@123.com", "true", "false"]])
    end

    it "retrieves a user with a search parameter" do
      new_user = Factory.create_user({:email => "xyz@123.com"})
      get :index, params: { format: "json", sSearch: "xyz" }
      expect(JSON.parse(response.body)["aaData"]).to eq([["xyz@123.com", "false", "false"]])
    end
  end
end
