class V1::AssessmentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_user

  def create
    if @user.survey_ids = assessment_params[:survey_ids]
      render json: @user, include: :surveys, status: :created
    else
      render json: @user, include: :surveys, status: 500
    end
  end

  private

  def set_user
    @user = User.find(assessment_params[:user_id])
  end

  def assessment_params
    params.require(:assessment).permit(:user_id, survey_ids: [], answers: [])
  end
end
