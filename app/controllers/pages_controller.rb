class PagesController < ApplicationController
  def home
    @jewel = Jewel.all.sample
  end

  def about
  end
    
  def support
  end

  def zenzai
  end
end
