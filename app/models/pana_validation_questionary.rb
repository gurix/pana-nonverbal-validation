class PanaValidationQuestionary < ActiveRecord::Base

  belongs_to :subject

  validates :page, presence: true

  # Validate if items are present
  10.times  {|i| validates "emoji#{i+1}"     presence: true, if: Proc.new { |q| q.page == 1 } }
  5.times   {|i| validates "wellbeing#{i+1}" presence: true, if: Proc.new { |q| q.page == 2 } }
  20.times  {|i| validates "mrs#{i+1}"       presence: true, if: Proc.new { |q| q.page == 3 } }
  10.times  {|i| validates "panava#{i+1}"    presence: true, if: Proc.new { |q| q.page == 4 } }
  5.times   {|i| validates "swls#{i+1}"      presence: true, if: Proc.new { |q| q.page == 5 } }
  3.times   {|i| validates "sam#{i+1}"       presence: true, if: Proc.new { |q| q.page == 6 } }
end
