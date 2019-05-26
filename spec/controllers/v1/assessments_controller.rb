require 'rails_helper'

RSpec.describe V1::AssessmentsController, type: :controller do
  describe 'POST to #create' do
    before(:each) do
      @user = create(:user)
      @survey = create(:survey)
    end

    context 'on success' do
      let(:params) do
        { user_id: @user.id, survey_ids: [@survey.id] }
      end

      before(:each) do
        authenticate_user
        post :create, params: { assessment: params }
        @user.reload
      end

      it 'assign a survey to a user' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT to #update' do
    before(:each) do
      @user = create(:user)
      @survey = create(:survey)
      @question = create(:question, id: 'b164db1c-8499-482c-b2c0-72acc2232a34',  survey: @survey)
      @assessment = create(:assessment, user: @user, survey: @survey)
    end

    context 'on success' do
      let(:hash) {}
      let(:params) do
        {
          user_id: @user.id,
          survey_id: @survey.id,
          answers: { 'b164db1c-8499-482c-b2c0-72acc2232a34': 'answer' }
        }
      end

      before(:each) do
        authenticate_user
        put :update, params: { id: @assessment.id, assessment: params }
        @assessment.reload
      end

      it { expect(response).to have_http_status(200) }
      it { expect(@assessment.answers).not_to be_empty }
    end
  end
end
