class SubjectsController < ApplicationController
  respond_to :html

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save

    respond_with(@subject, location: root_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:age, :gender, :education, :residence)
  end
end
