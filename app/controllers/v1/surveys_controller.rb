class V1::SurveysController < ApplicationController
  before_action :authenticate_user
  before_action :set_survey, only: [:show, :update, :destroy]

  def index
    @surveys = Survey.order(created_at: :desc)
    render json: @surveys
  end

  def show
    render json: @survey, include: :questions
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      render json: @survey, include: :questions, status: :created
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  def update
    if @survey.update(survey_params)
      render json: @survey, include: :questions
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
