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
        post :create, params: {assessment: params}
        @user.reload
      end

      it 'assign a survey to a user' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
