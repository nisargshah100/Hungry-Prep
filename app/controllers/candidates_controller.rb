class CandidatesController < ApplicationController
  before_filter :lookup_candidate, only: [:show, :update]

  def edit

  end

  def show

  end

  def update
    if @candidate.update_attributes(params[:candidate])
      redirect_to candidate_path(@candidate), notice: "Successfully Saved"
    else
     redirect_to edit_candidate_path(@candidate), notice: "Please try again"
    end
  end

  private

  def lookup_candidate
    @candidate = Candidate.find(params[:id])
  end

end
