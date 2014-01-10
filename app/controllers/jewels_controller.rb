require "presenters/jewel_presenter"
require 'verify_admin'

class JewelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_admin

  include Zenzai::VerifyAdmin

  def index
    @jewels = Jewel.all
  end

  def edit
    @jewel = Jewel.find(params[:id])
  end

  def update
    @jewel = Jewel.find(params[:id])
    if @jewel.update_attributes(params[:jewel])
      flash[:notice] = "Successful Update"
      redirect_to jewels_path
    else
      flash[:notice] = "Update did not succeed"
      redirect_to edit_jewel_path(params[:id])
    end
  end
end
