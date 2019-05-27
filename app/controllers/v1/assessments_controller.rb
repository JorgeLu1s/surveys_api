class V1::AssessmentsController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin, only: [:create]
  before_action :set_user

  def create
    if @user.survey_ids = assessment_params[:survey_ids]
      render json: @user, status: :created
    else
      render json: @user, status: 500
    end
  end

  def update
    @assessment = Assessment.find_by(user_id: assessment_params[:user_id], survey_id: assessment_params[:survey_id])

    if @assessment.update(assessment_params)
      render json: @assessment
    else
      render json: @assessment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(assessment_params[:user_id])
  end

  def assessment_params
    params.require(:assessment).tap do |whitelisted|
      whitelisted[:answers] = params[:assessment][:answers]
    end

    params.require(:assessment).permit(:user_id, :survey_id, survey_ids: [], answers: {})
  end
end
