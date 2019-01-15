class Duck < ApplicationRecord
  belongs_to :student
  validates :student_id, presence: true
end
