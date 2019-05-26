require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:params) { { username: 'username', email: 'user@surveys.com', password: 'secret', password_confirmation: 'secret' } }

  describe 'POST #create' do
    context 'returns http created' do
      before do
        authenticate_user
        post :create, params: { user: params }
      end

      it { expect(response).to have_http_status(:created) }
    end
  end
end
