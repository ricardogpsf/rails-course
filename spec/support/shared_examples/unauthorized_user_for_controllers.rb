RSpec.shared_examples "unauthorized get list" do |parameter|
    context 'when the user is not logged in' do
        before do
            request.headers['Accept'] = 'application/json'
            request.headers['token'] = ''
        end

        it 'returns http error 401' do
            get :index
            expect(response).to have_http_status(:unauthorized)
            expect(response.body).to eq('')
        end
    end
end