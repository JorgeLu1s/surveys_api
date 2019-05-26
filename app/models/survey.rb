class Survey < ApplicationRecord
  has_many :questions
  has_many :assessments
  has_many :users, through: :assessments

  validates_presence_of :title

  accepts_nested_attributes_for :questions
end
