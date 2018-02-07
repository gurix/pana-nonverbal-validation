class PanaValidationQuestionariesController < ApplicationController

  def new
    @pana_validation_questionary = PanaValidationQuestionary.new(params[:subject_id])
  end
end
