class PanaValidationQuestionary < ApplicationRecord
  belongs_to :subject

  # Validate presence for each item
  PanaValidationQuestionaryStructure.structure.each_with_index do |page, page_index|
    page.each do |item|
      validates(item, presence: true, if: proc { |q| q.page == (page_index + 2) })
    end
  end

  validates :page, presence: true
end
