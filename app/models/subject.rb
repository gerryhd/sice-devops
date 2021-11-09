class Subject < ApplicationRecord
  belongs_to :course
  belongs_to :career
end
