class AssessmentSerializer < ActiveModel::Serializer
  attributes :id, :survey_id

  belongs_to :user
  belongs_to :survey
end
