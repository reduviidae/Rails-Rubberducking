class Student < ApplicationRecord
  has_many :ducks

  validates :name, presence: true
  validates :mod, length: { in: 1..5 }
end
