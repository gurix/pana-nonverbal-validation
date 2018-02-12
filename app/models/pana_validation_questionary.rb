class PanaValidationQuestionary < ApplicationRecord
  belongs_to :subject

  validates :page, presence: true

  # Define the structure of the questionary to handle validations and strong parameters automatically
  def self.structure
    [
      [*1..10].map { |i| "emoji#{i}" },
      [*1..5].map { |i| "wellbeing#{i}" },
      [*1..20].map { |i| "mrs#{i}" },
      [*1..10].map { |i| "panava#{i}" },
      [*1..5].map { |i| "swls#{i}" },
      [*1..3].map { |i| "sam#{i}" }
    ]
  end

  # Validate presence for each item
  structure.each_with_index do |page, page_index|
    page.each do |item|
      validates(item, presence: true, if: proc { |q| q.page == page_index + 1 })
    end
  end

  def self.emoji_mapping
    {
      'gj' => [
        %w[PA3_lo PA1_hi],
        %w[NA2_lo NA1_hi],
        %w[PA4_hi PA4_lo3],
        %w[VA1_lo NA3_lo],
        %w[VA1_hi VA2_lo]
      ]
    }
  end
end
