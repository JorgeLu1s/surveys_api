require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:params) do
    {
      username: 'username',
      email: 'user@surveys.com',
      password: 'secret',
      password_confirmation: 'secret'
    }
  end

  describe 'POST #create' do
    context 'on success' do
      before do
        authenticate_admin
        post :create, params: { user: params }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(json.keys).to match_array([:id, :username, :email, :role]) }
      it { expect(json[:username]).to eq(params[:username]) }
      it { expect(json[:email]).to eq(params[:email]) }
    end
  end
end
