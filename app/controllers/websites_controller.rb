class WebsitesController < ApplicationController
  def create
    @website = Website.create(permit_params)
  end

  def index
    @websites = Website.all
    render layout: false
  end

  private
    def permit_params
      params.require(:website).permit!
    end
end
