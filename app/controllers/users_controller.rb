require 'verify_admin'

class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin

  include Zenzai::VerifyAdmin

  def index
    @users = User.all
  end
end
