require "presenters/jewel_presenter"

class JewelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin

  def index
    @jewels = Jewel.all
  end

  private
  
  def verify_admin
    puts current_user.inspect
    unless current_user.is_admin?
      flash[:error] = "You must be an admin to access this page"
      redirect_to root_path
    end
  end
end
