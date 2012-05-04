class CandidatesController < ApplicationController

  def edit
    @candidate = Candidate.find(params[:id])
    @questions = Question.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def update
    if current_user.candidate.update_attributes(params[:candidate])
      redirect_to candidate_path(current_user.candidate), notice: "Successfully Saved"
    else
     redirect_to edit_candidate_path(current_user.candidate)), notice: "Please try again"
    end
  end

end
