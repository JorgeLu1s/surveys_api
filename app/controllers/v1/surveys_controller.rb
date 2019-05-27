class V1::SurveysController < ApplicationController
  before_action :authenticate_user
  before_action :authorize_admin
  before_action :set_survey, only: [:show, :update, :destroy]

  def index
    @surveys = Survey.order(created_at: :desc)
    render json: @surveys
  end

  def show
    render json: @survey
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      render json: @survey, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def update
    if @survey.update(survey_params)
      render json: @survey
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @survey.destroy
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description, questions_attributes: [:id, :body])
  end
end
