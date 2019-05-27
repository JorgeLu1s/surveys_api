require 'rails_helper'

RSpec.describe V1::SurveysController, type: :controller do
  let(:params) do
    {
      title: 'Survey A',
      description: 'this is a survey',
      questions_attributes: [
        {
          body: 'Question A'
        },
        {
          body: 'Question B'
        }
      ]
    }
  end

  describe 'POST to #create' do
    context 'on success' do
      before do
        authenticate_admin
        post :create, params: { survey: params }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(json.keys).to match_array([:id, :title, :description, :questions]) }
      it { expect(json[:title]).to eq(params[:title]) }
      it { expect(json[:description]).to eq(params[:description]) }
      it { expect(json[:questions][0][:body]).to eq(params[:questions_attributes][0][:body]) }
      it { expect(json[:questions][1][:body]).to eq(params[:questions_attributes][1][:body]) }
    end

    context 'on error' do
    end
  end

  describe 'GET to #index' do
    context 'on success' do
      before do
        authenticate_admin
        get :index
      end

      it { expect(response).to have_http_status(200) }
      it { expect(response.body).not_to be_empty }
    end
  end

  describe 'UPDATE to #update' do
    before(:each) do
      @survey = create(:survey)
      @question = create(:question, survey: @survey)
    end

    context 'on success' do
      let(:attr) do
        { title: 'survey updated', description: 'survey description updated', questions_attributes: { id: @question.id, body: 'question updated' } }
      end

      before(:each) do
        authenticate_admin
        put :update, params: { id: @survey.id, survey: attr }
        @survey.reload
        @question.reload
      end

      it 'updates a survey' do
        expect(response).to have_http_status(200)
        expect(json[:title]).to eq(attr[:title])
        expect(json[:description]).to eq(attr[:description])
        expect(json[:questions][0][:body]).to eq(attr[:questions_attributes][:body])
      end
    end
  end
end
