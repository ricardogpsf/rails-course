require 'rails_helper'

RSpec.describe PrintersController, type: :controller do
  render_views

  describe "GET /index" do

    context 'when user is logged in' do
      let!(:printer) { FactoryBot.create(:printer_tatooine) }
      let!(:result) { [printer].to_json }
      let(:valid_user) { {name: 'Chaves', id: '100'} }
  
      before do
        request.headers['Accept'] = 'application/json'
        request.headers['token'] = 'some_token'
        expect_any_instance_of(ApplicationController).to receive(:find_used_from_api).and_return(valid_user)
      end
  
      it 'returns a printers list' do
        get :index
        expect(response).to have_http_status(:ok)
        expect(response.body).to match(result)
      end
  
      context 'when filtering by organization_id' do
        it 'returns only the printers that belong to the organization' do
          get :index, params: { org_id: printer.organization_id }
  
          expect(response).to have_http_status(:ok)
          expect(response.body).to match(result)
        end
  
        context 'and the organization does not have any printer' do
          it 'returns an empty list' do
            get :index, params: { org_id: 1000 }
    
            expect(response).to have_http_status(:ok)
            expect(response.body).to eq('[]')
          end
        end
      end
    end

    include_examples "unauthorized get list"
  end
end
