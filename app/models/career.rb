class Career < ApplicationRecord
  has_many :subjects
  has_many :courses, through: :subjects

  validates :name, presence: true
  validates :study_plan, presence: true
end
