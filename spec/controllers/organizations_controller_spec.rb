require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  render_views

  describe "GET /index" do
    include_examples "unauthorized get list"
  end
end
