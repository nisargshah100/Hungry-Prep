class CandidatesController < ApplicationController

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(params[:candidate])
      redirect_to candidate_path(@candidate), notice: "Successfully Saved"
    else
     redirect_to edit_candidate_path(@candidate), notice: "Please try again"
    end
  end

end
