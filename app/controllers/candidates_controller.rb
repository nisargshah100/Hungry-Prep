class CandidatesController < ApplicationController

  def edit
    @candidate = Candidate.find(params[:id])

    if @candidate.status.status > 0
      redirect_to candidate_path(params[:id]), notice: "Application has already been submitted"
    end

    @questions = Question.all
    @responses = @candidate.responses
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])
    @candidate.update_responses(params[:questions])
    if params[:ajax].blank?
      candidate_status = @candidate.status
      candidate_status.status_id = 1
      candidate_status.save
    end
    
    if @candidate.update_attributes(params[:candidate])
      redirect_to candidate_path(@candidate), notice: "Successfully Saved"
    else
      redirect_to edit_candidate_path(@candidate), notice: "Please try again"
    end

  end

end
