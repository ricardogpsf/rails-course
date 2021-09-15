class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.active
    respond_to do |format|
      format.html
      format.json { render json: @organizations }
    end
  end
end