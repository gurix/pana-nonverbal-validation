class Subject < ApplicationRecord
  validates :age, :gender, :education, :residence, presence: true
  validates_numericality_of :age, only_integer: true, greater_than: 10, less_than: 100
end
