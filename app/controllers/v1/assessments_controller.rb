class V1::AssessmentsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]

  def create
    @user = User.find(assessment_params[:user_id])

    if @user.survey_ids = assessment_params[:survey_ids]
      render json: @user, status: :created
    else
      render json: @user, status: :unprocessable_entity
    end
  end

  def update
    @assessment = Assessment.find(params[:id])

    if @assessment.update(assessment_params)
      render json: @assessment
    else
      render json: @assessment.errors, status: :unprocessable_entity
    end
  end

  private

  def assessment_params
    params.require(:assessment).permit(:user_id, :survey_id, survey_ids: [], answers: {})
  end
end
