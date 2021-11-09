class Course < ApplicationRecord
  has_many :subjects, dependent: :destroy
  has_many :careers, through: :subjects
end
