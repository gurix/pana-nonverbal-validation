class SubjectsController < ApplicationController
  respond_to :html

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save

    respond_with(@subject, location: new_subject_pana_validation_questionary_path(@subject))
  end

  private

  def subject_params
    params.require(:subject).permit(:age, :gender, :education, :residence)
  end
end
