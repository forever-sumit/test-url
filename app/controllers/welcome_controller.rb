class WelcomeController < ApplicationController

  def index
    @websites = Website.all
    @website = Website.new
  end
end
