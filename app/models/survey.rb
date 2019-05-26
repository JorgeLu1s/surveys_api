class Survey < ApplicationRecord
  has_many :questions
  validates_presence_of :title

  accepts_nested_attributes_for :questions
end
