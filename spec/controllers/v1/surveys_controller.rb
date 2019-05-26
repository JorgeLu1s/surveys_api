require 'rails_helper'

RSpec.describe V1::SurveysController, type: :controller do
  let(:params) { { title: 'Survey A', description: 'this is a survey', questions: [{ body: 'Question A' }, { body: 'Question B' }] } }

  describe 'POST #create' do
    context 'returns http created' do
      before do
        post :create, params: { survey: params }
      end

      it { expect(response).to have_http_status(:created) }
    end
  end

  describe 'GET #index' do
    context 'returns all the surveys' do
      before do
        get :index
      end

      it { expect(response).to have_http_status(200) }
    end
  end
end
