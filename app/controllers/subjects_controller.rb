class SubjectsController < ApplicationController
  respond_to :html

  def new
    @subject = Subject.new
    @subject.group = params[:group]
    check_group
  end

  def create
    @subject = Subject.new(subject_params)
    check_group
    location = new_subject_pana_validation_questionary_path(@subject) if @subject.save
    respond_with(@subject, location: location)
  end

  private

  def subject_params
    params.require(:subject).permit(:age, :gender, :education, :residence, :group)
  end

  # Ensure each subject is in a group and the choosen group is available
  def check_group
    raise 'missing group' unless @subject.group
    raise "#{@subject.group} is not available" unless PanaValidationQuestionaryStructure.valid_group? @subject.group
  end
end
