class Subject < ApplicationRecord
  validates :birth_year, :gender, :education, :residence, presence: true
end
